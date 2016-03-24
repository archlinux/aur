# Contributor: Axel Marchand <axel1.marchand@gmail.com>

_pkgname=Feather
pkgname=feather
pkgver=0.2.2
pkgrel=1
pkgdesc="Lightweight Window Manager"
arch=(i686 x86_64)
url="https://github.com/AxelMarchand/Feather"
license=('MIT')
depends=('libx11')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/AxelMarchand/${_pkgname}/archive/v${pkgver}.tar.gz
    01_makefile.patch)
md5sums=('250ccb10fe43c2effbdc7d51be896ef4'
         'f6099ce0e1f6fe51cf0caa5d484daa7e')


prepare() {
    cd ${_pkgname}-${pkgver}
    patch -Np0 -i ${srcdir}/01_makefile.patch
}

build() {
    cd ${_pkgname}-${pkgver}
    make TEMP_BINDIR=${srcdir}/${_pkgname}-${pkgver}
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR=${pkgdir} TEMP_BINDIR=${srcdir}/${_pkgname}-${pkgver} install
}
