# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=udr
pkgver=0.9.4
pkgrel=1
pkgdesc="A UDT wrapper for rsync that improves throughput of large dataset transfers over long distances."
arch=('x86_64')
url="http://www.labcomputing.org/"
license=(APACHE)
depends=(openssl crypto++ rsync udt)
checkdepends=(python-pytest)
provides=(udr)
conflicts=(udr-git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/martinetd/UDR/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fc3e42bd63b16ff8676dd973aac2cb9106777904440381a6fe41be007862da26')

prepare() {
  cd UDR-${pkgver}
}

build() {
  cd UDR-${pkgver}
  make -j1  # multithread build fails
}

check() {
  cd UDR-${pkgver}
  #pytest -vv tests  # broken
}

package() {
  cd UDR-${pkgver}
  install -m755 -Dt "${pkgdir}"/usr/bin/ src/udr
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}

# vim:set ts=2 sw=2 et:
