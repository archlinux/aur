# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=wireguard-ui-bin
pkgver=0.6.2
pkgrel=2
pkgdesc="A web user interface to manage your WireGuard setup."
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/ngoduykhanh/${pkgname%-bin}"
license=(MIT)
depends=(bash wireguard-tools)
source=(https://raw.githubusercontent.com/ngoduykhanh/${pkgname%-bin}/master/LICENSE
        ${pkgname%-bin}.service
        99-wg.conf
        wgiptables.sh
        wgui.path
        wgui.service)
source_i686=(${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-386.tar.gz)
source_x86_64=(${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-amd64.tar.gz)
source_armv7h=(${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-arm.tar.gz)
source_aarch64=(${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-arm64.tar.gz)
sha256sums=('e693e8a42aab8dfe07bb9210b5ab54facf61c1248b7f69a622791f293a22cf96'
            '99df93fd8e6916ddad872e9a1bee496de5173bc544dc2c09f5c2a688b8deac76'
            'cf5bdce2ce87b5054042a70d8630f40a0f991c64c42786824f660245b943d2be'
            'bc8b1cee00a541eab44dab5bd23afddb99d9c667a5d4d083d7bf9575b321052c'
            '4b63dee5d287bb16a8e1a588ba24ccaeb91a4e0d2993bfeb9a1fb423bf08432d'
            '6722f8665bcf91c724f754a756a61a9933999da93943fb8d788a9d6b82e1de40')
sha256sums_i686=('3945ce5c4a9210c2cb570dadff3ac73d1de7d26c6ac6dc8a20dfcf66e4051e49')
sha256sums_x86_64=('2769536c2ef4cc3630b209675167afd5f199f4cc9f9f0d22ce492592dc1dc68d')
sha256sums_armv7h=('8d8421557d857bd1af548c2e7951afe46f87c0b654b9d5c01d78e09e155b456f')
sha256sums_aarch64=('4d40cdd135381faacb8d09c8046512ecb7a37e9b8cbd58f86022d8dd093de23b')
conflicts=(${pkgname%-bin})
install=${pkgname%-bin}.install


package() {
  install -Dm644 LICENSE                           -t ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm755 ${pkgname%-bin}                   -t ${pkgdir}/usr/bin/
  install -Dm755 ${srcdir}/wgiptables.sh              ${pkgdir}/usr/bin/wgiptables
  install -Dm644 ${srcdir}/${pkgname%-bin}.service -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${srcdir}/wgui.{path,service}     -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${srcdir}/99-wg.conf              -t ${pkgdir}/etc/sysctl.d/
}
