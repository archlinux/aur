# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
_name=sshping
pkgname=${_name}-rs-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="SSH-based ping that measures interactive character echo latency and file transfer throughput. Pronounced \"shipping\"."
arch=("x86_64" "aarch64")
url="https://github.com/TeddyHuang-00/sshping"
license=("MIT")
provides=("sshping")
options=("!debug")
source=(
    "${url}/releases/download/v${pkgver}/${_name}.1"
)
source_x86_64=(
    "$pkgname-x86_64-$pkgver::${url}/releases/download/v${pkgver}/${_name}-x86_64-unknown-linux-musl.tar.xz"
)
source_aarch64=(
    "$pkgname-aarch64-$pkgver::${url}/releases/download/v${pkgver}/${_name}-aarch64-unknown-linux-musl.tar.xz"
)
# checksum generate with 'makepkg -g'
sha256sums=('99e0326e0eedc683789a2b7a0b9768be238e1faff9a6b615406462fd28157532')
sha256sums_x86_64=('b41748a2eb15d346908a7141980849c916ec871fc7dd590265d3716fd4a57023')
sha256sums_aarch64=('26f9f1edfaf7928d8bcfa29683ea43f7df436d96cd570e49e5190d7f0c272826')

package() {
    cd "${srcdir}/${_name}-${CARCH}-unknown-linux-musl/" || exit
    install -Dm755 ${_name} "${pkgdir}/usr/bin/${_name}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
    install -Dm644 ../${_name}.1 "${pkgdir}/usr/share/man/man1/${_name}.1"
}
