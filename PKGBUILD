# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Denis Vadimov <me@bloody.pw>

_name=phonesim
pkgname="${_name}-git"
pkgdesc="Phone Simulator for modem testing"
pkgver=2.1.r0.g5f12802
pkgrel=1
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/network/ofono/phonesim.git"
license=('GPL-2.0-or-later')
depends=('qt5-declarative' 'libpng' 'freetype2' 'libsm' 'libice' 'libxrender' 'fontconfig' 'libxext' 'libx11' 'harfbuzz' 'libxcb' 'graphite' 'libxau' 'libxdmcp')
makedepends=('git' 'gcc')

source=("${_name}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_name}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd "$srcdir/${_name}"
    ./bootstrap-configure
}

build() {
    cd "$srcdir/${_name}"
    make
}

package() {
    cd "$srcdir/${_name}"
    make DESTDIR="$pkgdir" install
}

