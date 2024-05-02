# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=wireguard-ui-bin
pkgver=0.6.2
pkgrel=7
pkgdesc="Web user interface to manage your WireGuard setup"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/ngoduykhanh/${pkgname%-bin}"
license=(MIT)
depends=(wireguard-tools)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
backup=(usr/bin/wgiptables)
install=${pkgname%-bin}.install
source=(
  https://raw.githubusercontent.com/ngoduykhanh/${pkgname%-bin}/master/LICENSE
  ${pkgname%-bin}.service
  99-wg.conf
  wgiptables.sh
  wgui.path
  wgui.service
)
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-arm64.tar.gz{,.md5})
source_armv7h=( $url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-arm.tar.gz{,.md5})
source_i686=(   $url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-386.tar.gz{,.md5})
source_x86_64=( $url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux-amd64.tar.gz{,.md5})
b2sums=(
  'e80645832ae08d6f693cfbc7834085effefef046ce6d09fcca4bc4c17b7a2e7ab74d0b34575999493876cc314ae73137ad16257b84dd0f2365e8af5ec7f6251c'
  '89d9e0ccc55a2b01b7625ddc7da70a260960c77e1fc2c876cd92934e41bb59bef2097af56813ab8cad1f8db7dc596fd5500f324722b626abeb4a8fa4b303a703'
  '9c018527a70120edbf2bd70279e61c1f257158e70f7c74d73ed74ec449b02538bae2ccacb722106eb66002e8704d51ffc279052f3e590691102d6577db346923'
  'a71cb02226b039b569cf22e7f1be6a9b5ec3cf096128b3a091141ca15192c59ef2c7f4989d04532ccdf6df1ce5f59ed1d4026a069793c343dd208332ee2f744a'
  'd7ea6f2c405abd6b2a07e6c216387e8eb085476899e8bf6101cbed41115934816d0362e2030e3165b481314d65b88adcc5bd4928071e34ceb602fa45ffe1db4d'
  'f7045f01d73757129cc98675d7fa87b477b780548fe2d72562c2aef33bdfb87c661fd6306c6e55a1d757f9c920bbcdc80f38f32b2a38df7029e5413ddc0b03aa'
)
b2sums_aarch64=('72c94f146562af3dfb5df26e8604a6fdd239615b5e20972c8f35f3fb69dc1c8dccdfacfaf370360d948b440fbf5cf3b1c124f718dae9f72bc6ebcc0eac6dd100' 'SKIP')
b2sums_armv7h=( '79309718db8718b5358dc219c21cb469af7f7b78ec3dadd9221dfe56c0fdec969da05ccfbfdb04df0f1890eea13864a2872abd3d15f6b9f44ae36c51cb9e1e0d' 'SKIP')
b2sums_i686=(   'a48ed6664fb254770809143aef6da6527dcb17d2042c43dbb5ffd89e7716414680862545fa56228a50632f1e4cc495e4da043393486498b2b375252d70bc0c34' 'SKIP')
b2sums_x86_64=( '587624309ce24571990c42b089032bd0e34536acc733d621e88bdf18f9f4d6d187dadc98e4ff4797cfa258d8336488c31f9b1be6870a5c70b62c11b2da2e0b18' 'SKIP')

prepare(){
  echo $(<*.md5) *.tar.gz | md5sum -c -
}

package() {
  install -vDm644 99-wg.conf              -t "$pkgdir"/etc/sysctl.d/
  install -vDm755 ${pkgname%-bin}         -t "$pkgdir"/usr/bin/
  install -vDm755 wgiptables.sh              "$pkgdir"/usr/bin/wgiptables
  install -vDm644 ${pkgname%-bin}.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 wgui.{path,service}     -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/${pkgname%-bin}/
}
