# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=pamlx
_pkgname=pamlX
pkgver=1.3.1
pkgrel=4
pkgdesc="A Graphical User Interface for PAML https://doi.org/10.1093/molbev/mst179"
arch=('x86_64')
url="http://abacus.gene.ucl.ac.uk/software/"
license=('custom')
depends=('qt5-base' 'paml')
makedepends=('make')
provides=('pamlx')
source=("http://abacus.gene.ucl.ac.uk/software/pamlX${pkgver}-src.tgz" "pamlX.desktop" "qt4to5.patch")
sha256sums=('e6abbbc715aff1d9ebcb6d9b7c2fb494f916bee53f9cf807bf38cebc7bd625bf'
            'e70746b45dfdde9baa1f38db29474296fbd3cb0a8b1fb685260d6c01f373938b'
            'f1ae154e78d95f1c6656c9d4d838de825e8ef92b9002803ceed9b2f1445b95e3')

prepare(){
	cd $_pkgname$pkgver-src
	patch -p1 < $srcdir/qt4to5.patch
}

build() {
	cd $_pkgname$pkgver-src
	qmake
	make
}

package() {
	mkdir -p $pkgdir/usr/{bin,share/{icons,applications}}
	install -Dm 755 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
	cd $_pkgname$pkgver-src
	install -Dm 755 $_pkgname $pkgdir/usr/bin/$_pkgname
	install -Dm755 pamlxlogo.png $pkgdir/usr/share/icons/$_pkgname.png
}

