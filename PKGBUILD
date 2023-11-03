# Maintainer: éclairevoyant
# Contributor: Devin J. Pohly <djpohly+arch at gmail dot com>

pkgname=coil64
_gitname=Coil64
pkgver=2.1.29
pkgrel=1
pkgdesc="Coil inductance calculator (formerly Coil32)"
arch=(x86_64)
url="https://coil32.net/"
license=(GPL3)
depends=(gcc-libs glibc qt5-base)
source=("$pkgname-$pkgver.tar.gz::https://github.com/radioacoustick/$_gitname/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.png")
b2sums=('f31ab6ecf887fc076655ec9c4ad2788ab7f7912f255982cc0eda0b4347c1c8dbf5435c92b4fedfb9f2145c4c33d712d00e6257d9b72ac37f63053c8376742cf0'
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
