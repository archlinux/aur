# Maintainer: a2sc <a_dev at a2sc eu>
# Contributer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=livekit-bin
provides=('livekit')
conflicts=('livekit')
pkgver=1.13.11
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

sha256sums=('c8d9b7ba9d66c8b5f314a438c0c2493815e7e70085e37706b888cab3c4ab8f8d'
            'c23c7576f6ab9e94cde3501581a5732e3678bd51321903cff3171906456c40bf')
sha256sums_x86_64=('1e9ee90ca301e1842b2887fc77cb122759756a9c8aeb4334ee91de3325ec43fb')
sha256sums_aarch64=('2af6ce091d6b3c79d1677f8ff1bbb91a8007f40b2325c059b52d38383c0830b6')
sha256sums_armv7h=('5f663a6498c3d81ef2dce55a3a1e7815aacfe78207e469abc0bd9c5b5ca5070b')

package() {
  install -vDm755 "${srcdir}/livekit-server" -t "$pkgdir/usr/bin"
  install -vDm644 ${pkgname/-bin}.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm644 ${pkgname/-bin}-$pkgver/config-sample.yaml -T "$pkgdir/etc/$pkgname/config.yaml"
}
