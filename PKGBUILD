# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=openxlr-yabridge
pkgver=5.1.1.54
pkgrel=4
pkgdesc="Tested Windows plugin bridge for OpenXLR, with the Wine editor input fix"
arch=('x86_64')
url="https://github.com/emaspa/openxlr"
license=('GPL-3.0-only' 'GPL-3.0-or-later')
depends=('wine' 'gcc-libs' 'glibc' 'libxcb' 'dbus')
makedepends=('meson' 'ninja' 'cmake' 'pkgconf' 'python' 'rust')
optdepends=('openxlr: the mixer that uses this bridge')
options=('!strip' '!debug' '!lto')
source=("https://github.com/emaspa/openxlr/releases/download/v0.1.41/openxlr-yabridge-${pkgver}-source.tar.xz")
sha256sums=('d40d5541afb51379b8abc743a34c9021a1c7a57eb9e52b955d419e83a8b7807c')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python3 openxlr-packaging/build.py build \
    --source "$srcdir/${pkgname}-${pkgver}" \
    --output "$srcdir/build" \
    --jobs "$(nproc)"
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python3 openxlr-packaging/build.py stage \
    --source "$srcdir/${pkgname}-${pkgver}" \
    --output "$srcdir/build" \
    --destdir "$pkgdir" \
    --prefix /usr
}
