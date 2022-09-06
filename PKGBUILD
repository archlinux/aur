# Maintainer: Juanjo Gutiérrez <juanjo at gutierrezdequevedo dot com>
pkgname=gvisor-tap-vsock
pkgver=0.4.0
pkgrel=1
pkgdesc="A new network stack based on gVisor"
arch=('x86_64')
url="https://github.com/containers/gvisor-tap-vsock"
license=('Apache-2.0')
provides=('gvisor-tap-vsock')
source=($pkgname-$pkgver.tar.gz::https://github.com/containers/gvisor-tap-vsock/archive/refs/tags/v$pkgver.tar.gz
        https://github.com/balajiv113/gvisor-tap-vsock/commit/9d91db50729f64bc439c3b03e7400262d1233c58.diff)
sha256sums=('896cf02fbabce9583a1bba21e2b384015c0104d634a73a16d2f44552cf84d972'
            'cd51a17c2d1100c2c05d7d0a26686fc2a0d8b56d9ba3ba23a5ae4f92f08afa32')
makedepends=('go')

build() {
    cd "$pkgname-$pkgver"
    patch -p1 < ../9d91db50729f64bc439c3b03e7400262d1233c58.diff
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
