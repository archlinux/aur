# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nomad
pkgver=0.3.0
pkgrel=1
pkgdesc="A Distributed, Highly Available, Datacenter-Aware Scheduler"
arch=('i686' 'x86_64')
url="https://www.nomadproject.io/"
license=('MPL')
depends=('glibc')
makedepends=('go' 'godep' 'git')
source=(https://github.com/hashicorp/nomad/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('b5e7520cdd542df14ae35778c066e296c41bb6aba8bf8286956f3005f407c486')

build() {
	cd $pkgname-$pkgver
	export GOPATH="$srcdir"
	godep get || true
	godep go build
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 $pkgname-$pkgver "$pkgdir"/usr/bin/$pkgname
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
