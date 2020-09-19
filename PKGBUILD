# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=gnushogi
pkgver=1.4.2
pkgrel=3
pkgdesc="A computer program that plays the game of Shogi, also known as Japanese Chess."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gnushogi/"
license=('GPL')
depends=('glibc')
makedepends=('autoconf' 'gcc')
source=("http://ftp.gnu.org/gnu/gnushogi/gnushogi-${pkgver}.tar.gz"
        "gcc-10-globals.patch")
sha256sums=('1ecc48a866303c63652552b325d685e7ef5e9893244080291a61d96505d52b29'
            'bc4818c5ca20aab50f684d1dcf13745310980ba00932f34babb45388258c97dd')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/gcc-10-globals.patch"
}

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
