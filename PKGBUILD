# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=libmatheval
pkgver=1.1.11
pkgrel=2
pkgdesc="A C/Fortran library to parse and evaluate symbolic expressions input as text."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libmatheval/"
license=('GPL-3.0-or-later')
depends=('flex' 'glibc')
makedepends=('guile')
source=("https://ftp.gnu.org/gnu/libmatheval/${pkgname}-${pkgver}.tar.gz"
        https://sources.debian.org/data/main/libm/libmatheval/1.1.11%2Bdfsg-5/debian/patches/002-skip-docs.patch
        https://sources.debian.org/data/main/libm/libmatheval/1.1.11%2Bdfsg-5/debian/patches/003-guile3.0.patch
        https://sources.debian.org/data/main/libm/libmatheval/1.1.11%2Bdfsg-5/debian/patches/disable_coth_test.patch
        )
md5sums=('595420ea60f6ddd75623847f46ca45c4'
         'e25aacf73d881a8badc3223601e69863'
         'ea2d6e48e91e734677749fcdc5acb375'
         'c01c49fe5684929042d9f041452cb381')
sha1sums=('d4720860403c36ebe955b1b5c31c6c3ca20b2a25'
          '9c49f98d74ed076f710ec8eb499edc46ce4d0af5'
          '058612ff66bbb49a032583ef14f7de2c6fbf43d9'
          'df4f4a9a76cec4d6b583135b7a03ed3472031815')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/002-skip-docs.patch"
  patch -p1 -i "${srcdir}/003-guile3.0.patch"
  patch -p1 -i "${srcdir}/disable_coth_test.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr GUILE=/usr/bin/guile GUILE_CONFIG=/usr/bin/guile-config
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
}
