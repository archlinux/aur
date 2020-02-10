# Maintainer: Max Zhao <alcasa.mz@gmail.com>
pkgname=kube-spawn
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool for creating multi-node Kubernetes clusters on a Linux machine using kubeadm & systemd-nspawn. Brought to you by the Kinvolk team. https://kinvolk.io"
arch=("any")
url="https://github.com/kinvolk/kube-spawn"
license=('Apache')
depends=("cni-plugins")
makedepends=("docker")
source=(
"https://github.com/kinvolk/$pkgname/archive/v$pkgver.tar.gz"
)
sha512sums=('b7cdabb3339080f498c1c6054466c663924488cf1e716e9a20f34c8da1ffe141a96110ce9007b5c99b340b7ecdfc944c3930db3afd749a67c073306e7d379cbe')

build() {
	cd "$pkgname-$pkgver"
	make DOCKERIZED=y
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	make PREFIX=$pkgdir/usr install
}
