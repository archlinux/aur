# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=ucspi-unix
pkgver=1.0
pkgrel=1
pkgdesc="UNIX-domain socket client-server command-line tools"
arch=('i686' 'x86_64')
url="http://untroubled.org/ucspi-unix"
depends=('bash')
source=("http://untroubled.org/ucspi-unix/archive/${pkgname}-${pkgver}.tar.gz")
license=('GPL')
md5sums=('071271a4c8f571bdd8255240cf252884')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i "1s/\$/ $(echo -n $CFLAGS | sed 's/[\/&]/\\&/g')/" conf-cc
  sed -i "1s/\$/ $(echo -n $LDFLAGS | sed 's/[\/&]/\\&/g')/" conf-ld
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install prefix="${pkgdir}/usr" mandir="share/man"
}
