# Maintainer: éclairevoyant
# Contributor: Devin J. Pohly <djpohly+arch at gmail dot com>

pkgname=coil64
_gitname=Coil64
pkgver=2.1.27
pkgrel=1
pkgdesc="Coil inductance calculator (formerly Coil32)"
arch=(x86_64)
url="https://coil32.net/"
license=(GPL3)
depends=(gcc-libs glibc qt5-base)
source=("$pkgname-$pkgver.tar.gz::https://github.com/radioacoustick/$_gitname/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.png")
b2sums=('6f25e2a0592fa2be3eeb9a8c192a571f36cc07fdabeb2592d01b9153a2f4f1dec8a469331c461b060365e5b5f6263dd21b5f4e211595965f477ef73d345a8297'
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
