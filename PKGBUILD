# Maintainer: Juanjo Gutiérrez <juanjo at gutierrezdequevedo dot com>
pkgname=gvisor-tap-vsock
pkgver=0.3.0
pkgrel=1
pkgdesc="A new network stack based on gVisor"
arch=('x86_64')
url="https://github.com/containers/gvisor-tap-vsock"
license=('Apache-2.0')
provides=('gvisor-tap-vsock')
source=($pkgname-$pkgver.tar.gz::https://github.com/containers/gvisor-tap-vsock/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6ca454ae73fce3574fa2b615e6c923ee526064d0dc2bcf8dab3cca57e9678035')
makedepends=()

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -d -m 0755 "$pkgdir/usr/bin"
    install -d -m 0755 "$pkgdir/usr/lib/podman"
    install -m 0755 "bin/vm" "$pkgdir/usr/bin/vm"
    install -m 0755 "bin/qemu-wrapper" "$pkgdir/usr/bin/qemu-wrapper"
    install -m 0755 "bin/gvproxy" "$pkgdir/usr/lib/podman/gvproxy"
}
