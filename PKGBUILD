# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
_pkgname=rx
pkgname=${_pkgname}-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A modern and extensible pixel editor implemented in Rust (this package downloads and extracts the official AppImage)"
arch=("x86_64")
url="https://cloudhead.io/rx/"
license=("GPL3")
depends=("libx11" "gcc-libs")
provides=(${_pkgname})
conflicts=(${_pkgname})
options=(!strip)
_appimage_file="$_pkgname-$pkgver-$CARCH-unknown-linux-gnu.AppImage"
source=("https://github.com/cloudhead/rx/releases/download/v$pkgver/$_appimage_file")
noextract=("$_appimage_file")
sha256sums=('bbbd51a3eade9966b768480da4e92680e12bb979f47cc5d61aff460474ee8b6a')

build() {
  chmod +x "$_appimage_file"
  mkdir -p "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  ../"$_appimage_file" --appimage-extract
}

package() {
  cd "$pkgname-$pkgver/squashfs-root"
  install -Dm755 "usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "usr/share/icons/hicolor/128x128/apps/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
