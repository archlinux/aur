# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.16.3
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
sha512sums=('6b85695735ef7075d457152eccd216d599173e4569cd51a0e28e17e3d7974e087683234cc178f097f973035f70d4e43de8db5aa702260a2148cae3a66957634e')
sha512sums_aarch64=('6f9839b9bded29b69a631dff5e7f9d60f51a0a7681f9a2c47607a96e1e125aab811fc24b832e8c6f6426459b9ab1cc61afb42d0924e819d7f303322e24a9ed74')
sha512sums_armv6=('13834fbfa439b4258e885c93608e08fce1d0139b05dbca3fd57de935b23c10a39f81440d1ae8a3a7d115edde81cea61d49272c54536a6162d6b2be123ad4cea9')
sha512sums_armv7l=('9dc9a295afbdbfc5d09acece707a3a0e5efe3fe6e2112b430194d3aeda4ae9e2bff4f9928cf7de1c4ff31e7a50c189a350d9fe2bc273ab1e2007aefa2ae507c4')
sha512sums_i686=('2a0be1a811fa6461e35ef8242951cc05ea62a0ba74fbc8f2faf58645ad1f262206b307b3e41b9fa2eedf1e6e5dc45cd79be019fe3aef9b3a78b6a8738a645966')
sha512sums_x86_64=('476dfb0cd3f54c07df3bc2a262dbdac68d02ad2bad57b9875cfaa68596f00386fb0fb55194d5946114a9fe62b40f0b95e4cdf894074ef87869dc99f5828fa127')
b2sums=('3feee02c8bd529f2b9a19eb6b87f84f7f7835e3e05813ea45b9860f852c19000dd404f64488d82463190e6986a4c5dd18f377743223406306edfb6bb38eff285')
b2sums_aarch64=('5441a9cdfdb23c573b67c2a1c318f40f4f99272d3258c753e6e8ff6d48cdd5a2737ce238226c6ecc7b1a7502d1a3d8eb40e916148a249d98fe32523c12454ee1')
b2sums_armv6=('49ee3fbb687864163b34809517ce9f8d8d385a2ba170bd1e6cbe03e506155a2757dac4906ec571e3c4a0f755c856361df6a346a41a6fef5305300cffb3d458e5')
b2sums_armv7l=('1455042ffe39428b7cbabe10f9f5ddf95562fbda88ca7e8a7034846a2628a078471640261add6d35fd1e1970a1dc9f5ed28c83e77dba3ef274cacc808679e773')
b2sums_i686=('373006bcaa9d134867b04f5e36d987ef0fd7b31417a2ff3aef92bb54e903143716bb437aef7b3deb734fa301f4ce2c3080abff3c4c775f0d2eb5855fa19594e3')
b2sums_x86_64=('1b12476ea33f9b8b354269dbb161dd00d78d0e808b617597aadd761895e36f0966408f341dabcdb8b609ce57967f27a8fcb4d1b919d5f22c6deb5fff7dc80ccd')

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
