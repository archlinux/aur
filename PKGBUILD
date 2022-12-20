# Maintainer: Juanjo Gutiérrez <juanjo at gutierrezdequevedo dot com>
pkgname=gvisor-tap-vsock
pkgver=0.5.0
pkgrel=1
pkgdesc="A new network stack based on gVisor"
arch=('x86_64')
url="https://github.com/containers/gvisor-tap-vsock"
license=('Apache-2.0')
provides=('gvisor-tap-vsock')
source=($pkgname-$pkgver.tar.gz::https://github.com/containers/gvisor-tap-vsock/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8048f4f5faa2722547d1854110c2347f817b2f47ec51d39b2a7b308f52a7fe59')

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
