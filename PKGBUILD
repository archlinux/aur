# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.16.4
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
sha512sums=('9502fdbede100f0d9fb1d49a9199689e9320739fb989e4c4b601c9fc008e1b8396f09af3fced86ca8d2a3cfc320a853e3e2a86f725b89c069295805029e3cc96')
sha512sums_aarch64=('4c58f3c9c5422838659eb1c0d7013d996856e64af928fd905824c9413b58dd9a538619d134675d339639c886beac23aca22c2c0545d91a7bceb8db013b0fb6de')
sha512sums_armv6=('59d8419d529c9fb1ab4a8bc18b8bf71dc530b9e0bf21b3df9c08ca41efd8f2015fc8f40e5298f2060a0a85395bbeb2e70cceea94a28d9254ff656de5e0e85518')
sha512sums_armv7l=('a46aef94b31faccc74418ee6221893d21dc87482452381ee5c8e28876787da42f0255637252a45902ebeef9576564744f9499a805eddbc764848f177cba69eb5')
sha512sums_i686=('c41a1abda7bb277194b7e5292fd1813a70a9fb22f158b3ea4f4b50cd89c86c0eff793a36f441a370090afe3d6caf99c22c856dd86593636337ca8d77eb722403')
sha512sums_x86_64=('00d3db1404dcae2baaba2919c19e3756eb7023023fb7406d7240802c862aefae6449c05964bb02f52a9655e132b0a6d1c9861ec157bfc731d666349d7bd3a2c2')
b2sums=('2ecfe480d97bb3cfca82d25899493e3becbae4ac2124a22ca33ffe0475355985fdfb2e50b4aedd379ecc88d0eaf1a9fadb6d63ad6ef2de42fd38aef16c349306')
b2sums_aarch64=('269d8b20603c2a8ea59f23f1aee2d4edac2a8cbbb84c4080c9dd611b743b5f156f646a6d858f641b2d938256cd2f208d48cd97f5319a2aed8d821de6e8c0dcbf')
b2sums_armv6=('09e1d96a8ef4b878db2f4b117784efa68199a2326ee4f64d4d89edaaf8804a15ef6535d5d4e9759c59582ff1f10257941398c779855155262017a8f288232359')
b2sums_armv7l=('a77f17b2e2ba6cb44f19af61c2c7b5b5dd08da82769200de98f83c260a0bca5db4952a7b2daa27fc7c2a28db3829f3f26aad129439f89bcb495aaf38dd0df86c')
b2sums_i686=('14a892bc66caace39fd5a7e180da804669f97914b0575c97702d8140f57fde207a2f4279a87a248147085f984082b4bb347aab9e06523a53d53c6d3e17f92950')
b2sums_x86_64=('4d4c728b335c4dd04e07f3d7a46c698e89ab0992ed47b4800320cbd06d0e6a75e8aef9831592ed2a840a3724d4e1ee5ae03971d3cbba736a995305c57f8a4cbf')

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
