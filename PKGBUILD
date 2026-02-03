# Maintainer: Guashark <221940752+Guashark@users.noreply.github.com>
# Author: SpeedyNote Team <info@speedynote.org>

# This is a user uploaded package.
pkgname=speedynote-src
pkgver=1.2.1
pkgrel=1
pkgdesc="A user uploaded package from official release source of SpeedyNote"
arch=('x86_64')
options=('!debug')
url="https://github.com/alpha-liu-01/SpeedyNote"
license=('GPLv3')
depends=('glibc' 'gcc-libs' 'qt6-base' 'qt6-svg' 'mupdf' 'mujs' 'tesseract-data-eng')
makedepends=('git' 'cmake' 'qt6-tools')
source=("SpeedyNote-$pkgver-2.tar.gz::https://github.com/alpha-liu-01/SpeedyNote/archive/refs/tags/v$pkgver-2.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/alpha-liu-01/SpeedyNote/v$pkgver/LICENSE")
sha256sums=('23c4b26ff19a2baef6e80bd5a263ad8abb5ef61d4db830b1354ac6fc02355eb9'
            'b3fac2b0946e0676aaef25f841b1be51df3331289301520e9a0bf23da9f93f01')

build() {
  cd "$srcdir/SpeedyNote-$pkgver-2"
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/SpeedyNote-$pkgver-2"

  # 安装二进制文件 
  install -Dm755 "build/NoteApp" "$pkgdir/usr/bin/$pkgname"

  # 安装图标
  install -Dm644 "resources/icons/mainicon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # 安装许可协议
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 安装桌面文件
  install -d "$pkgdir/usr/share/applications"
  echo "[Desktop Entry]
Name=SpeedyNote
Comment=A user uploaded package from official release source of SpeedyNote
Exec=$pkgname
Icon=$pkgname
Type=Application
Terminal=false
Categories=Utility;TextEditor;
Keywords=notes;markdown;" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}

