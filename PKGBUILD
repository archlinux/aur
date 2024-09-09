# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=xtmsplit
pkgver=0.2
pkgrel=7
pkgdesc="Xtremsplit-compliant file splitter/merger"
arch=('x86_64')
url="http://www.software.caelistis.be/"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('patch')
source=(http://www.software.caelistis.be/${pkgname}-${pkgver}.tar.gz
        https://raw.githubusercontent.com/felixonmars/archriscv-packages/master/xtmsplit/fix-format.patch)
sha512sums=('4fbfbe4c736c6ff24d1ad7ae71f7c7f89d9f6b0d1777eb6878d59e3ffe3962edcf6cd62abdd67ad37c6669a731ed1f768aafb52a8b5f6b7672b45accfb08abad'
            '9f2688b852ed8ab7a92ff4ec0ad4ea2dbc8c04db5cb87264d3e9bad16900b86d9f1cc017451a3c4a03ec3e05ab3f10bdd1d7d6d7f64794160425cd600b76954b')

prepare() {
  cd ${pkgname}

  patch -p1 -i ../fix-format.patch
}

build() {
  cd ${pkgname}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}

  make DESTDIR="${pkgdir}" install
}
