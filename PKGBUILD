# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.17.1
pkgrel=1
pkgdesc="Bypass DPI"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/hufrea/${pkgname%-bin}"
license=(MIT)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
backup=("etc/${pkgname%-bin}.conf")
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-aarch64.tar.gz)
source_armv7h=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv7l.tar.gz)
source_i686=(   $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-i686.tar.gz)
source_x86_64=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-x86_64.tar.gz)
sha512sums=('c910adaef996dc4af83793ce2e6302236c48a7fabead3b5fa8f834c613d560c31b7aab02e4b8763d242cee9890e3b2bc1a255b092b0f69f3258a9f520df5ff7b')
sha512sums_aarch64=('e98b8d44e835b2e5ad7668fc10143ed80ecd0b565a46582e9586e30145712d1f2026a0f2c9a57ae0d80b9e29be295691d3e396d197cd7d7448b05539849f5e0a')
sha512sums_armv7h=('841b14939cf9cdcd2521cecc2f4814536b54aeb11cec9fa37efc8c50d7ba3d32d2e94a2de6e038781329623c5f58f25f1b040dfb2f1d00eda2e69d75cb26d2c8')
sha512sums_i686=('e5aaa7a364debcbe5c8770ccd064329948ba4073cbb0992012f2604e2b10a9479faba02f78211f65ef6fc72d54471cbc37f555e7689bfbdde063db61ebaeb315')
sha512sums_x86_64=('d60ea3ed4b5352583b787992bbc73f1660f80f6ccbf5e192f6493acd7498b134eda9bdd7c855cf72346b7f6103b65b23a88e386a1afa52e3adf2b514da9be0da')
b2sums=('85c948815e372a6c1fd7a28c7cf5495c30c38339dffdcc653b12a01168b114b3010036b3a11095bf1a41ef99ca40f8fc59d1aa315c2a014d877fe5eeb0955c0a')
b2sums_aarch64=('9a7c47ad3404bc1cd3ee0a171bdf66efcbb1d4ac7d96256b45d85d893e46163ab6eb55554f7771beb7fe620ac7493e4bbd377ab8b03d580f94d636e046431c5e')
b2sums_armv7h=('523fdc4d7e264f15cc0649e43e7691dc96787397beeebc7272eeaa020c7ee2d5c7d6f34ba8e10e3ebb3cd4c46d01d1de3c00b47cab430b603f55e4fc6d36e066')
b2sums_i686=('a5a78e526eb216d5d13c8053d82d85867108376f8feeea9a39600cee76fc8f52d6dd4572f156a471fd110a5350c0edb363d10cdb9b7e8f302f4e0a8a01678834')
b2sums_x86_64=('9d67056f963951ad6239fa59a2f56dd9492d79142323cbb9ae256f2554e1a88df94b8562484239616adf9d736d6b3f3100d54ffe7ea188c1311868a41c4c08fa')

prepare() {
  sed -i 's|ciadpi|/usr/bin/ciadpi|' ${pkgname%-bin}-$pkgver/dist/linux/${pkgname%-bin}.service
}

package() {
  install -vDm 755 ciadpi-${CARCH/7h/7l} "$pkgdir"/usr/bin/ciadpi
  cd ${pkgname%-bin}-$pkgver
  install -vDm 644 dist/linux/${pkgname%-bin}.conf -t "$pkgdir"/etc/
  install -vDm 644 dist/linux/${pkgname%-bin}.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
