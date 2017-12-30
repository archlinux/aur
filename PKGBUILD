# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=libmatheval
pkgver=1.1.11
pkgrel=1
pkgdesc="A C/Fortran library to parse and evaluate symbolic expressions input as text."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libmatheval/"
license=('GPL3')
depends=('flex')
makedepends=('guile2.0')
source=("https://ftp.gnu.org/gnu/libmatheval/${pkgname}-${pkgver}.tar.gz"
        "removeifndefs.patch"
        "replace-obsolete-functions.patch")
md5sums=('595420ea60f6ddd75623847f46ca45c4'
         'b340ca489388a8c7986654f4be8127f4'
         '5a58a75ad710d8847be3931944404429')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/removeifndefs.patch"
  patch -p1 -i "${srcdir}/replace-obsolete-functions.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr GUILE=/usr/bin/guile2.0 GUILE_CONFIG=/usr/bin/guile-config2.0
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
}
