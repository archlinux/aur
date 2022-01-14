# Maintainer: Vadym Livertovsky <vadym@livertovsky.name>

pkgname=karbowanecwallet-git
pkgver=v.1.7.7.r1.g40047b1
pkgrel=1
pkgdesc='Karbowanec Wallet - wallet for Karbo (Karbovanets) cryptocurrency'
arch=('i686' 'x86_64')
url='https://github.com/seredat/karbowanecwallet.git'
license=('custom')
makedepends=(cmake git)
depends=(boost)
source=($pkgname::git+"$url")
sha256sums=(SKIP)

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	git clone https://github.com/seredat/karbowanec.git cryptonote
    mkdir -p build
	cd build

	cmake ..
	make
}

package() {
	cd $pkgname/build
	make install
}
