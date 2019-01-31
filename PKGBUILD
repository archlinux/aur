# Maintainer: insdavm <insdavm at gmail dot com>

pkgname=igg-git
pkgver=0.1.r1.gf73283a
pkgrel=1
pkgdesc="A command line utility for geolocating IP addresses and host names"
arch=('any')
url="https://gitlab.com/nxl4/igg"
license=('GPL3')
makedepends=('git')
depends=('python')
provides=('igg')
conflicts=('igg')
source=('igg::git+http://gitlab.com/nxl4/igg.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
