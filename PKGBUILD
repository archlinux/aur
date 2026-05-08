# Maintainer: Sandra Keßler <mail@sandra-kessler.net>
pkgname=zerodds-bin
_pkgname=zerodds
pkgver=1.0.0_rc1
pkgrel=1
pkgdesc="Pure-Rust OMG Data Distribution Service implementation (precompiled binaries)"
arch=('x86_64' 'aarch64')
url="https://zerodds.org"
license=('Apache-2.0')
provides=('zerodds')
conflicts=('zerodds')
depends=('glibc' 'gcc-libs')
source_x86_64=("https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.1/zerodds-1.0.0-rc.1-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.1/zerodds-1.0.0-rc.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "${srcdir}"
    install -dm755 "${pkgdir}/usr/bin"
    local bin
    for bin in zerodds-{ws,mqtt,coap,amqp,grpc,corba}-bridged \
               zerodds-{admin,idlc,xmlc,record,replay,bench,monitor,mq,pcap,perf} \
               zerodds-ros2-shim; do
        if [[ -f "$bin" ]]; then
            install -m755 "$bin" "${pkgdir}/usr/bin/${bin}"
        fi
    done
    if [[ -f libzerodds.so ]]; then
        install -dm755 "${pkgdir}/usr/lib"
        install -m755 libzerodds.so "${pkgdir}/usr/lib/libzerodds.so"
    fi
    if [[ -f zerodds.h ]]; then
        install -dm755 "${pkgdir}/usr/include"
        install -m644 zerodds.h "${pkgdir}/usr/include/"
    fi
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" 2>/dev/null || true
}
