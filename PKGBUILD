# Maintainer: Dan Schaper ( dschaper at ganymeade dot com )

pkgname=tcllauncher-git
pkgver=1.5.r6.g460debe
pkgrel=1
pkgdesc="A launcher for Tcl applications"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/flightaware/tcllauncher"
license=('BSD')
provides=('tcllauncher')
source=(${pkgname}::git://github.com/flightaware/tcllauncher.git)
md5sums=('SKIP')
depends=('tcl')
makedepends=('git' 'autoconf')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd ${pkgname}
        autoconf
        ./configure
        make
}

package()
{
        cd ${pkgname}
        make install DESTDIR=${pkgdir}
        install -Dm644 license.terms ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

