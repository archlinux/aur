# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=atp-bin
pkgver=0.3.8
pkgrel=1
pkgdesc='Fountain-coded file transfer (RaptorQ over UDP/QUIC) that outruns tuned rsync on real networks'
arch=('x86_64' 'aarch64')
url='https://github.com/Dicklesworthstone/atp'
license=('LicenseRef-MIT-with-OpenAI-Anthropic-Rider')
depends=('gcc-libs' 'glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')

source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('88a5594d829ab0bdb57456053fd30c38da9aa9f0c8336e6229567d836ee5ab48')
sha256sums_aarch64=('1470f45d2f8b23f32b72ad40a5da315db5f59f1e84f84b9f15b6d1bf160569cc')

latestver() {
    gh api repos/Dicklesworthstone/atp/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    install -Dm755 atp "${pkgdir}/usr/bin/atp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
