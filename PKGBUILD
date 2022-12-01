# Maintainer: éclairevoyant
# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>

pkgname=coil64
_gitname=Coil64
pkgver=2.1.25
pkgrel=1
pkgdesc="Coil inductance calculator (formerly Coil32)"
arch=('x86_64')
url="https://coil32.net/"
license=('GPL3')
depends=('qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/radioacoustick/$_gitname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('67dad390ddfb2f2659104a76f54a7ea4974e11e9fa60432ce59d8678f7b0c8633dbc40c30d580765622919d5eeb024b5ab03a235281f2bd4abee7f55cbf2b253')

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
