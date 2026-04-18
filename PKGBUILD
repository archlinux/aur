# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=xshogi
pkgver=1.4.2
pkgrel=2
pkgdesc="A computer program that plays the game of Shogi, also known as Japanese Chess."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gnushogi/"
license=('GPL')
depends=('gnushogi' 'libxaw')
makedepends=('gcc')
source=(http://ftp.gnu.org/gnu/gnushogi/${pkgname}-${pkgver}.tar.gz
        0001-implicit-declaration.patch
        0002-Fix-declaration-of-yyerror.patch)
sha256sums=('2e2f1145e3317143615a764411178f538bd54945646b14fc2264aaeaa105dab6'
            '10e82a9d24003299a4ed2f50cafe9e4eca8bfec9257101e3eadd75d83b72cb8a'
            '7e9fc5337531f8e161beab82123ebf370440cf49af75d3fac3e91308f6948b4c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < ../0001-implicit-declaration.patch
  patch -p1 < ../0002-Fix-declaration-of-yyerror.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr/" install
}
