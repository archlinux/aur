# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=sqlite-vector
pkgver=1.0.0
pkgrel=1
pkgdesc='cross-platform, ultra-efficient SQLite extension that brings vector search capabilities to your embedded database.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/sqliteai/${pkgname}"
license=('Elastic-2.0')
depends=('glibc' 'sqlite3')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
       "${pkgname}.install")
sha256sums=('dc93c5f2fac6e2d221f619cfa85ff5983ef1c4784664443f5511d0abc864707f'
	    '2d3981176c07c67789ec4a8d60bddf7bfa21c300e3c2f17fb2320562a64bfda4')
install="sqlite-vector.install"


build(){
    cd "$srcdir/${pkgname}-${pkgver}"
    make all
}


package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    # copy file vector.so to /usr/lib:
    install -d -m755 $pkgdir/usr
    install -d -m755 $pkgdir/usr/lib
    cp ./dist/vector.so $pkgdir/usr/lib/

    # copy file LICENSE.md into /usr/share/licenses/sqlite-vector:
    install -d -m755 $pkgdir/usr/share
    install -d -m755 $pkgdir/usr/share/licenses
    install -d -m755 $pkgdir/usr/share/licenses/${pkgname}
    cp ./LICENSE.md $pkgdir/usr/share/licenses/${pkgname}
    
    # include files README.md and QUANTIZATION.md as documentation:
    install -d -m755 $pkgdir/usr/share/${pkgname}
    cp ./README.md $pkgdir/usr/share/${pkgname}
    cp ./QUANTIZATION.md $pkgdir/usr/share/${pkgname}
} 
