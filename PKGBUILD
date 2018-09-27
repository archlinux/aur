# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Lara Maia <lara@craft.net.br>

_pkgname=bimp
pkgname=gimp-plugin-bimp
pkgver=1.18
pkgrel=2
pkgdesc='Batch Image Manipulation Plugin for GIMP.'
arch=('x86_64' 'i686')
url='http://www.alessandrofrancesconi.it/projects/bimp/'
license=('GPL')
depends=('gimp')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/alessandrofrancesconi/${pkgname}/archive/v$pkgver.tar.gz
        bimp-gegl.patch)
md5sums=('84b748a4f1fa0bd67da12a77b65b4611'
         '74dbdad37d3fadd467111016d4b211c6')


prepare() {
    cd $pkgname-$pkgver

    patch -Np1 -i "${srcdir}/bimp-gegl.patch"
}

build() {
    cd $pkgname-$pkgver

    make
}

package() {
    cd $pkgname-$pkgver

    mkdir -p "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
    cp ./bin/bimp "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
    cp -Rf ./bimp-locale/  "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
}
