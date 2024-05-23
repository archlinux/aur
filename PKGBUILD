# Maintainer: paradoxxx.zero <paradoxxx.zero@gmail.com>

pkgname=zed-editor-preview-bin
pkgver=0.137.0
pkgrel=2
pkgdesc="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter. (binary package)"
arch=('x86_64')
url="https://github.com/zed-industries/zed"
license=('GPL3')
depends=("alsa-lib" "gcc-libs" "glibc" "libxau" "libxcb" "libxdmcp" "libxkbcommon" "libxkbcommon-x11" "zlib")
_filename="zed-linux-${CARCH}.tar.gz"
_appdir="zed-preview.app"
source=("$pkgname-$pkgver.tar.gz::https://zed.dev/api/releases/preview/${pkgver}/${_filename}")
sha256sums=('99336c43348e92c2cf0e333cc4664e49332c20ccc988a0dc520511b56e66e57b')
provides=(zed-editor)
conflicts=(zed-editor)
options=(!strip !debug)

package() {
  tar -xv -f "$srcdir/$pkgname-$pkgver.tar.gz" "${_appdir}/bin" "${_appdir}/share"
  cd "${_appdir}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "bin/zed"
  install -Dm0755 -t "$pkgdir/usr/bin/" "bin/cli"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "share/applications/zed-preview.desktop"
  cp -r "share/icons" "$pkgdir/usr/share/"
}
