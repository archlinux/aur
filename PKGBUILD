# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-git'
pkgver=1.0.0.r158.gf1be1714d
pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
install=chia-git.install
depends=('git' 'python' 'python-websockets')
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
	pip install https://download-chia-net.s3-us-west-2.amazonaws.com/simple/miniupnpc/miniupnpc-2.1.tar.gz
	pip install -e .
}

package() {
	mkdir -p "$pkgdir"/opt
	mv chia-blockchain "$pkgdir"/opt
}
