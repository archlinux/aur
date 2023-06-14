# Manitainer: grgergo <csakbek@freemail.hu>

pkgname='xawm'
_pkgname='XawM'
pkgver=1.6
pkgrel=3
pkgdesc='Xaw with Modern look and feel'
arch=('x86_64')
url='https://xawm.sourceforge.net'
license=('unknown')
depends=('libxmu' 'libxpm')
makedepends=('imake')

source=("$_pkgname-$pkgver.tar.gz::https://downloads.sourceforge.net/project/xawm/xawm/1.6/XawM-1.6.src.tar.gz"
        'https://www.ibiblio.org/pub/X11/contrib/widgets/Xaw3d/R5/laygram.h'
				'XawM.patch')
sha256sums=('d848d78eb240cbe396b59cbe0d70ef5844eb5f1e5f899baf29f346a83c4d229a'
            '5f4aab317b5691fbacbb7f063902358388e24f0e89ff61c60a6d7de785f6b9e8'
            '824ed6b3d988b383cb463efb900a2e424b6c3fa56102de2a105a52b9ad881741')

provides=('libxaw')

prepare() {
	cd "$_pkgname-$pkgver"
	cp '../laygram.h' .
}

build() {
	cd "$_pkgname-$pkgver"
	xmkmf
	patch < ../XawM.patch
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
