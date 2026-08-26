# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Lara Maia <lara@craft.net.br>

_pkgname=bimp
pkgname=gimp-plugin-bimp
pkgver=2.6
pkgrel=4
pkgdesc='Batch Image Manipulation Plugin for GIMP'
arch=('x86_64' 'i686')
url='http://www.alessandrofrancesconi.it/projects/bimp/'
license=('GPL')
depends=('gimp-2')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/alessandrofrancesconi/${pkgname}/archive/v$pkgver.tar.gz)
md5sums=('e88c978abde481d2124ba9d73a56e14b')


build() {
    cd $pkgname-$pkgver
    # Change incompatible-pointer-type back to warning instead of error (default GCC 14)
    # https://github.com/alessandrofrancesconi/gimp-plugin-bimp/issues/411
    # Alternative: adding -fpermissive
    # https://github.com/alessandrofrancesconi/gimp-plugin-bimp/pull/412
    CFLAGS+=' -Wno-error=incompatible-pointer-types'
    make
}

package() {
    cd $pkgname-$pkgver

    mkdir -p "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
    cp ./bin/bimp "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
    cp -Rf ./bimp-locale/  "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
}
