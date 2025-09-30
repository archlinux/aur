# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Juanjo Gutiérrez <juanjo at gutierrezdequevedo dot com>

pkgname=gvisor-tap-vsock
pkgver=0.8.7
pkgrel=1
pkgdesc="A new network stack based on gVisor"
arch=('x86_64')
url="https://github.com/containers/gvisor-tap-vsock"
license=('Apache-2.0')
provides=('gvisor-tap-vsock')
source=($pkgname-$pkgver.tar.gz::https://github.com/containers/gvisor-tap-vsock/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('ef9765d24bc3339014dd4a8f2e2224f039823278c249fb9bd1416ba8bbab590b')

makedepends=('go')

build() {
    cd "${pkgname}-${pkgver}"

    make
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm 0755 "bin/gvforwarder" "${pkgdir}/usr/bin/gvforwarder"
    install -Dm 0755 "bin/gvproxy" "${pkgdir}/usr/bin/gvproxy"
    install -Dm 0755 "bin/qemu-wrapper" "${pkgdir}/usr/bin/qemu-wrapper"

    install -dm 0755 "${pkgdir}/usr/lib/podman"
    ln -sf "/usr/bin/gvforwarder" "${pkgdir}/usr/lib/podman/gvforwarder"
    ln -sf "/usr/bin/gvproxy" "${pkgdir}/usr/lib/podman/gvproxy"
}
