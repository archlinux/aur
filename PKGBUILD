# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Lara Maia <lara@craft.net.br>

_pkgname=bimp
pkgname=gimp-plugin-bimp
pkgver=2.0
pkgrel=2
pkgdesc='Batch Image Manipulation Plugin for GIMP'
arch=('x86_64' 'i686')
url='http://www.alessandrofrancesconi.it/projects/bimp/'
license=('GPL')
depends=('gimp')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/alessandrofrancesconi/${pkgname}/archive/v$pkgver.tar.gz
        01_gcc_fcommon.patch)
md5sums=('715a543f158fa9dd7a4f46dd2f28bb89'
         '413ff72eb1a5cd6e7440ee6363b7aaeb')


prepare() {
    patch -Np0 -i 01_gcc_fcommon.patch
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
