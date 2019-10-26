# Contributor: Andrew Clunis <andrew@orospakr.ca>
# Contributor: Ben R <thebenj88@gmail.com>
# Maintainer: Loïc Bidoux <loic.bidoux@owndata.org>

pkgname=vrms-arch
pkgver=0.1.0.r25.g802c767
pkgrel=1
pkgdesc="vrms for ArchLinux"
arch=('any')
url="https://github.com/orospakr/${pkgname}"
license=('custom:BSD3')
makedepends=('git')
depends=('python' 'pyalpm')
source=("git+https://github.com/orospakr/${pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/v*//'
}

build() {
  cd "$srcdir/${pkgname}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}"
  python setup.py install --root=${pkgdir}
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
