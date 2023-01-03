# Maintainer: éclairevoyant
# Contributor: Devin J. Pohly <djpohly+arch at gmail dot com>

pkgname=coil64
_gitname=Coil64
pkgver=2.1.26
pkgrel=2
pkgdesc="Coil inductance calculator (formerly Coil32)"
arch=('x86_64')
url="https://coil32.net/"
license=('GPL3')
depends=('qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/radioacoustick/$_gitname/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.png")
b2sums=('811805c27477ab9b987e16201ec45b04c924b8a923d6d62f697c576fb0363a899bf91ad7f68ce3e8337667070ad3d9c458690c2daf6c1b9c3635c81fc2fe7a0d'
        '0eff9bb34f0c2ee12db8a1f86d43bb5b8322f4f7e4b062cc5b528f4e794930942a0e917eca4c093cd6128a34254fa74fa1cb84bf494524eab4f7195b626b29c8'
        'dd9575c42bbc66895343cd33c08512511fa6afca476c970e11a7a0bed231be1e34f1ad24f94086342cc3317a9dc589c2b9a1412ad7eaafaabebc75052c5ec04a')

prepare() {
	# Arch prefers executables be compiled position-independent
	sed -i '/-no-pie/ s/^/#/' $_gitname-$pkgver/$_gitname.pro
}

build() {
	cd $_gitname-$pkgver
	qmake $_gitname.pro
	make
}

package() {
	install -Dm755 $_gitname-$pkgver/$_gitname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 $pkgname.png -t "$pkgdir/usr/share/pixmaps/"
}
