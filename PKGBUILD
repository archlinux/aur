# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=wireguard-ui-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A web user interface to manage your WireGuard setup."
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/${pkgname%-bin}/${pkgname%-bin}"
license=(MIT)
depends=(bash wireguard-tools)
source_i686=(${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-386.tar.gz)
source_x86_64=(${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-amd64.tar.gz)
source_armv7h=(${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-arm.tar.gz)
source_aarch64=(${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-arm64.tar.gz)
source=(https://raw.githubusercontent.com/${pkgname%-bin}/${pkgname%-bin}/master/LICENSE
		${pkgname%-bin}.service
        99-wg.conf
        wgiptables.sh
        wgui.path
        wgui.service)
sha256sums_i686=('c55ae2f6e316c90762cdb3bd2377cc583a37bed98f64d08dd1a578b16420e61c')
sha256sums_x86_64=('9da61adc68868fe1a1e9e1c40e47d65a18551dabe146b5389cd3e21f4d03ef50')
sha256sums_armv7h=('ad3e68bc0a445c97b9c041dafa3339abcb5c563f4856aaa33449bae2b3473fde')
sha256sums_aarch64=('00efafd1a9f9e19c116eccb84661abc51cb3df6c391e3b38cc14d82d4af58b27')
sha256sums=('e693e8a42aab8dfe07bb9210b5ab54facf61c1248b7f69a622791f293a22cf96'
            '99df93fd8e6916ddad872e9a1bee496de5173bc544dc2c09f5c2a688b8deac76'
            'cf5bdce2ce87b5054042a70d8630f40a0f991c64c42786824f660245b943d2be'
            'bc8b1cee00a541eab44dab5bd23afddb99d9c667a5d4d083d7bf9575b321052c'
            '4b63dee5d287bb16a8e1a588ba24ccaeb91a4e0d2993bfeb9a1fb423bf08432d'
            '6722f8665bcf91c724f754a756a61a9933999da93943fb8d788a9d6b82e1de40')
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
