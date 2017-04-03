# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=gnushogi
pkgver=1.4.2
pkgrel=2
pkgdesc="A computer program that plays the game of Shogi, also known as Japanese Chess."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gnushogi/"
license=('GPL')
depends=('glibc')
makedepends=('autoconf' 'gcc')
source=("http://ftp.gnu.org/gnu/gnushogi/gnushogi-${pkgver}.tar.gz")
sha256sums=('1ecc48a866303c63652552b325d685e7ef5e9893244080291a61d96505d52b29')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh
  ./configure --prefix=/usr --datarootdir=/usr/share
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr" install
  mkdir -p "${pkgdir}/usr/share"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/man"
  mv "${pkgdir}/usr/info" "${pkgdir}/usr/share/info"
}
