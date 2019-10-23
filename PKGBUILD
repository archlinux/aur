# Maintainer: Denis Vadimov <me@bloody.pw>

pkgname=phonesim
pkgdesc="Phone Simulator for modem testing"
pkgver=1.21.r0.g7664fdc
pkgrel=1
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/network/ofono/phonesim.git/"
license=('GPLv2')
depends=('qt4' 'libpng' 'freetype2' 'libsm' 'libice' 'libxrender' 'fontconfig' 'libxext' 'libx11' 'harfbuzz' 'libxcb' 'graphite' 'libxau' 'libxdmcp')
makedepends=('git' 'gcc')
source=('phonesim::git+https://git.kernel.org/pub/scm/network/ofono/phonesim.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/phonesim"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "$srcdir/phonesim"
    echo "--- Starting PKGBUILD logs ---"
    git checkout $(git describe --abbrev=0 --tags)
    echo "[BUILD] Checking-out master->$(git describe --abbrev=0 --tags)"
    ./bootstrap-configure
    make
}

package() {
    cd "$srcdir/phonesim"
    make DESTDIR="$pkgdir" install
    echo "--- Finishing PKGBUILD logs ---"
}
