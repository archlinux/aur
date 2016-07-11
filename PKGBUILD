# Contributor: Andrew Clunis <andrew@orospakr.ca>
# Contributor: Ben R <thebenj88 *AT* gmail *DOT* com>
# Maintainer: Loïc Bidoux <loic.bidoux [at] owndata.org>

pkgname=vrms-arch
pkgver=0.1.0.r18.g7cda27d
pkgrel=1
pkgdesc="vrms for ArchLinux"
arch=('any')
url="https://github.com/orospakr/${pkgname}"
license=('custom:BSD3')
makedepends=('git')
depends=('python' 'pyalpm')
source=("git+https://github.com/orospakr/${pkgname}.git")
md5sums=('SKIP')

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
