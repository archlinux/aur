# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-git'
pkgver=1.0rc2.r0.g6518b2bf
pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
depends=('git' 'python')
makedepends=('cmake')
conflicts=('chia')
provides=('chia')
options=('!strip')
source=("git+https://github.com/Chia-Network/chia-blockchain.git")
sha256sums=('SKIP')

pkgver() {
	cd chia-blockchain
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd chia-blockchain 
	python3 -m venv venv
	ln -s venv/bin/activate .
	. ./activate
	pip install --upgrade pip
	pip install wheel
	pip install --extra-index-url https://download.chia.net/simple/ miniupnpc==2.1
	pip install -e . --extra-index-url https://download.chia.net/simple/
}

package() {
	mkdir -p "$pkgdir"/opt
	mv chia-blockchain "$pkgdir"/opt
}
