# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.16
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
b2sums=(        '7a80864864a736d68824596dbe086bb4a6f90661fd02a2231c7c023ab7b098e5b38f73fa8acb8adc5f73de16d328875d42bdd3fd5f4dd34f40d9d51fd8b22e5e')
b2sums_aarch64=('8bcaf05d14b8a791fee974e975815f57dae22d8e11c6e04f218fe9b2b72d2d5480a0b040236c191aa00dfb7801e8be73d4ce60b99072d9bddd78305230f79051')
b2sums_armv6=(  '691b0f02195acd84074651fde298997a6f66b8497eee00e330eb4b23c50d6fe5cd308fec014f60b0ac8b407b44e66756fa7a3dc0deb4ae049424659197062a09')
b2sums_armv7l=( '5c279d6dc4bbc71b730e246856a1971486229480520a2698c2d5e093f70f9426972aa035c51e1f28ac9be510a684d76e2b731b58ee8c830d810c0965f1e7e6ce')
b2sums_i686=(   '04c6ce812819c50c7c10f787792cd06cb0b12961b0ec99111d57586bc338cbc610dae28aec09de6513f9876cb74b5970ab4bc4e09438c1e65751359fa8fcb371')
b2sums_x86_64=( '779956111d103694c60a0c86a6d0fb4ae0e06640c06d70699eee8cd98ace1fc5cf95238980a72df595c42d8131b15e9747d9f7a420c907a2a0de44d85f4441b1')

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
