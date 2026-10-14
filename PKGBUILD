# Maintainer: a2sc <a_dev at a2sc eu>
# Contributer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=livekit-bin
provides=('livekit')
conflicts=('livekit')
pkgver=1.13.10
pkgrel=1
pkgdesc='LiveKit: Real-time video, audio and data for developers'
arch=(x86_64 aarch64 armv7h)
url='https://livekit.io/'
license=(Apache)
optdepends=(redis)
options=(!debug)
backup=("etc/livekit/config.yaml")
source=(
  "https://github.com/livekit/livekit/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname/-bin}.service"
)
source_x86_64=(
    "https://github.com/livekit/livekit/releases/download/v${pkgver}/livekit_${pkgver}_linux_amd64.tar.gz"
)

source_aarch64=(
    "https://github.com/livekit/livekit/releases/download/v${pkgver}/livekit_${pkgver}_linux_arm64.tar.gz"
)

source_armv7h=(
    "https://github.com/livekit/livekit/releases/download/v${pkgver}/livekit_${pkgver}_linux_armv7.tar.gz"
)

sha256sums=('d1b93ced314b14654faceeb99627a79114b8ebe002bb5d620be4a185db83a4b2'
            'c23c7576f6ab9e94cde3501581a5732e3678bd51321903cff3171906456c40bf')
sha256sums_x86_64=('c25a3e45fb922e9a93c6443d10c0ed041ba64342097e38632331736630283165')
sha256sums_aarch64=('ff60607e1931ff078576882fa11c087aa5821d635ac0c47f56ff77e203e32006')
sha256sums_armv7h=('53527b3a0c52661dcac726614bcefb42702e36fd7bf9b389be971f8d8e4661c1')

package() {
  install -vDm755 "${srcdir}/livekit-server" -t "$pkgdir/usr/bin"
  install -vDm644 ${pkgname/-bin}.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm644 ${pkgname/-bin}-$pkgver/config-sample.yaml -T "$pkgdir/etc/$pkgname/config.yaml"
}
