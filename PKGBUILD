# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.15
pkgrel=1
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6 armv7l i686 x86_64)
url="https://github.com/hufrea/${pkgname%-bin}"
license=(MIT)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
backup=(etc/${pkgname%-bin}.conf)
source=(        $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-aarch64.tar.gz)
source_armv6=(  $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv6.tar.gz)
source_armv7l=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv7l.tar.gz)
source_i686=(   $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-i686.tar.gz)
source_x86_64=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-x86_64.tar.gz)
b2sums=(        'adceb3106c16d8aefe2040d8f12d9118107b23d2eac57f4a295f7800b655e889e6507f8800d1f0cc46e1365df2c987c764c68f6ab3df9a0dee3a226746e195c7')
b2sums_aarch64=('0a587705056cfbb66e021caa44b3bb2bafdef35667b9bcbc746bf711e7d08904980e6a4afed19e395117338bb4c5b06020c5155d3156093962fdfbdc123e510b')
b2sums_armv6=(  '7d8d4dc473494aa898b2166e267123f8eebd201bc4c2a48b6044d06aa35340ffa0093ee9db949e5e10b9c218d53ba6af1843cb2aaaa9332904b53599216b0bfa')
b2sums_armv7l=( 'c4d036c489b3f7253409c24bb1b037a6bc7bf4badbe143b7574d4eece838c0d6ca654c0465da5fd44b061f9d6d7a2e20df3ad9ae66f108f62700454593226cae')
b2sums_i686=(   '2be9e1135dac636bcf23ace8a652e0c4cc1183d3bc737ea7fddf9cbed8af1eaf02a7bc3e6e844835dfb32f6d4ffbf33796d32fb776bb10556fb10dbd57b285c1')
b2sums_x86_64=( '11188ec066385c28f581a17a1a63a08882812abc8cd0a92a6bc65b5afd6de9e4a3022f3e493e41f287fb205fcdf613a40b0a86231e9f6c99f9368b26e3184b5a')

prepare() {
  sed -i 's|ExecStart=ciadpi|ExecStart=/usr/bin/ciadpi|' ${pkgname%-bin}-$pkgver/dist/linux/${pkgname%-bin}.service  
}

package() {
  install -vDm755 ciadpi-$CARCH                         "$pkgdir"/usr/bin/ciadpi
  cd ${pkgname%-bin}-$pkgver
  install -vDm644 dist/linux/${pkgname%-bin}.conf    -t "$pkgdir"/etc/
  install -vDm644 dist/linux/${pkgname%-bin}.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 LICENSE                            -t "$pkgdir"/usr/share/licenses/$pkgname/
}
