# Maintainer: éclairevoyant
# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>

pkgname=coil64
_gitname=Coil64
pkgver=2.1.26
pkgrel=1
pkgdesc="Coil inductance calculator (formerly Coil32)"
arch=('x86_64')
url="https://coil32.net/"
license=('GPL3')
depends=('qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/radioacoustick/$_gitname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('811805c27477ab9b987e16201ec45b04c924b8a923d6d62f697c576fb0363a899bf91ad7f68ce3e8337667070ad3d9c458690c2daf6c1b9c3635c81fc2fe7a0d')

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
}
