# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>
# Contributor: TDY <tdy at archlinux dot info>
# Contributor: Adam Ehlers Nyholm Thomsen <adament at gmail dot com>
# Contributor: Nathan Jones <nathanj at insightbb dot com>

pkgname=ledger
pkgver=3.1.1
pkgrel=1
pkgdesc='A double-entry accounting system with a command-line reporting interface.'
arch=('i686' 'x86_64')
url='http://www.ledger-cli.org'
license=('BSD')
depends=('boost>=1.49' 'gmp>=4.2.2' 'mpfr>=2.4.0')
makedepends=('cmake' 'python')
options=('!libtool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ledger/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('eae070cbbc1a40a277f1394d72ef0fe6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./acprep --prefix=/usr opt update
  cmake ./ -DCMAKE_INSTALL_LIBDIR=/usr/lib -DBUILD_EMACSLISP:BOOL=ON -DUSE_PYTHON:BOOL=ON -DBUILD_DOCS:BOOL=OFF
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
