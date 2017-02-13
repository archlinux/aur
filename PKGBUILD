# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mario Steele <mario@ruby-im.net>
pkgname=autovala
pkgver=1.1.0
pkgrel=1
pkgdesc=""
arch=('any')
url=""
license=('GPL3')
groups=('vala')
depends=(
	'vala>=0.20.0'
	'cmake>=3.5.0'
	'libgee>=0.16.0'
	'gtk3>=3.18.0'
	'bash-completion>=2.3'
)
makedepends=(
	'vala>=0.20.0'
	'cmake>=3.5.0'
	'libgee>=0.16.0'
	'gtk3>=3.18.0'
	'pandoc>=1.17.0.0'
	'bash-completion>=2.3'
)
provides=('autovala')
install=autovala.install
source=("http://github.com/rastersoft/$pkgname/archive/$pkgver.tar.gz")
md5sums=('2989d6e3039dd6fa1cd676eeca914f27')

build() {
	cd "$pkgname-$pkgver"
	rm -rf install
	mkdir install
	cd install
	cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="/usr/lib"
	make
}

package() {
	cd "$pkgname-$pkgver"/install
	make DESTDIR="$pkgdir/" install
}
