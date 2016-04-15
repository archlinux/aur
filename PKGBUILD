# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=contrafold
pkgver=2.02
pkgrel=2
pkgdesc="CONditional TRAining for RNA Secondary Structure Prediction"
arch=('i686' 'x86_64')
url="http://contra.stanford.edu/contrafold/"
license=('custom:BSD')
depends=('gcc-libs')
makedepends=('gcc>=4.1.3')
source=("http://contra.stanford.edu/contrafold/${pkgname}_v${pkgver/./_}.tar.gz"
        "LICENSE"
        "LBFGS.patch"
        "Utilities.patch")
md5sums=('cea66c63df835fe7f790c7f49ce83ef3'
         'b69f7a6ed121ab25aebc714785a84d30'
         '7f5cc03bb145d7f4ff8e18ede22bbdd7'
         '1edad72c52d336a0fa17862371dd60d0')

prepare() {
	cd "$pkgname/src"
	patch -p0 -i "$srcdir/LBFGS.patch"
	patch -p0 -i "$srcdir/Utilities.patch"
}

build() {
	cd "$pkgname/src"
	make clean
    make
}

package() {
    install -d "$pkgdir/usr/bin/"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    install "$pkgname/src/contrafold" "$pkgdir/usr/bin/"
    install LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
