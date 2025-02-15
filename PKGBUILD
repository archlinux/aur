# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.16.6
pkgrel=1
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6 armv7l i686 x86_64)
url="https://github.com/hufrea/${pkgname%-bin}"
license=(MIT)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
backup=("etc/${pkgname%-bin}.conf")
source=("${pkgname%-bin}-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-aarch64.tar.gz)
source_armv6=(  $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv6.tar.gz)
source_armv7l=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-armv7l.tar.gz)
source_i686=(   $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-i686.tar.gz)
source_x86_64=( $url/releases/download/v$pkgver/${pkgname%-bin}-${pkgver:2}-x86_64.tar.gz)
sha512sums=('8511f7e85b5fc840c84bf5093149632bb0b8d34b2fe5f9430cb675ef3235b4e5feff9e6b0c65a2fa509f6e3aa0cc90b2c07c2ef3ebc0f555f390bae5e02446dd')
sha512sums_aarch64=('c3527b39cd946e5a4a9f0f525cf84caba70fdc11d7b944be800b30473a4185ac62fba7d5475e4fcccc4ddd871bf136c19a8ecd187dac67eeb288b7b144b270da')
sha512sums_armv6=('49dd664c3274d544fd7c36c2ab94f882ffe6a5f156a4c9ac3a3bd7ff0ba2a90b00796824cb519f93697b8dfbb79974715571b5622527c111ed824e1e58e71a4b')
sha512sums_armv7l=('68e080b9f87ac09f9d7de1403fc6427c719a09672a4061029f427feccf12259db1924e0228c671144b0055e6f48f4b001125748f57f08fc4837e4536436909d6')
sha512sums_i686=('3abcea4329bc5a4a170d2bca2f88eb7d2f697fd94bbe9bbdc61d978423a32f6ff8304e822a36428298ac45b8eb0d60e8a5bf3ba67189613b74b70e5bde23b943')
sha512sums_x86_64=('4d39431463f05c0cdbc11e568f98caee5032db746a057647ee8c95dc44702130d7ed302a4f7e824fbede9659eb0dd253c390b2f9be1a992edf0bdf530502d34d')
b2sums=('d276699e30c701645655b04a84811d1b33fc7aa63f7a5abd7883ccd83d22aeed1ca2c94b0bd5be55ef8da02f0ed4c398f7d0e83860c5d54a45fd9006d3fe3a3f')
b2sums_aarch64=('1feece9d3565bd841d5d27153789b9949e3b6d6cc4ca0ecdd4297edbf58b888ed2fffe04ab5849cb094858cd10d4e7cf0bcadccc8b046d12dc81a5fbd8c73b9b')
b2sums_armv6=('304991d17602d15a929c7fc9713b1e30a49a47af01ef9eceac5478bfcf00bf52633d39ebdc19096b04157e6e017440f9e644e2336e3023e90b965d75ac8b85bb')
b2sums_armv7l=('4c72105a56342e10b02a48d3b8c09f19a823e8e30dbc78d5e730a96fa9a16dbd5bfc3b79ee37ada20b838e9ecd5e0794adc60701017d36e8f560a5cfa9acd366')
b2sums_i686=('e4da1bdf613f1aa3eea5e9b81aa638def22385be3cc7e0ac828f93b81feb59685f88f51b4db1e86d46b90bc704ce1fc416fa34cbebaa23c7e826a422a8c406e3')
b2sums_x86_64=('f927f63e4dc63d1741a451a43f9ed924b6e1a9939556a8621eef493a2bd1642667d04c41e62d40ebc4084939c9111fdadae566ad61eff538ae763c2975751e09')

prepare() {
  sed -i 's|ciadpi|/usr/bin/ciadpi|' ${pkgname%-bin}-$pkgver/dist/linux/${pkgname%-bin}.service  
}

package() {
  install -vDm 755 ciadpi-$CARCH "$pkgdir"/usr/bin/ciadpi
  cd ${pkgname%-bin}-$pkgver
  install -vDm 644 dist/linux/${pkgname%-bin}.conf -t "$pkgdir"/etc/
  install -vDm 644 dist/linux/${pkgname%-bin}.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
