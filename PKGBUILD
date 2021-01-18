# Maintainer: Yurii <yu.hrysh@posteo.net>
# Contributor: Andrew Clunis <andrew@orospakr.ca>
# Contributor: Ben R <thebenj88@gmail.com>
# Contributor: Loïc Bidoux <loic.bidoux@owndata.org>

pkgname=vrms-arch-git
_pkgname=vrms-arch
pkgver=0.1.0.r33.g2cef2cb
pkgrel=1
pkgdesc="(gardenapple's fork) Virtual Richard M. Stallman for Arch Linux"
arch=('any')
url="https://github.com/gardenappl/${_pkgname}"
license=('custom:BSD3')
makedepends=('git')
depends=('python' 'pyalpm')
source=("git+https://github.com/gardenappl/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/v*//'
}

build() {
  cd "$srcdir/${_pkgname}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --root=${pkgdir}
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

