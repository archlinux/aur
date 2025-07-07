# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=byedpi-bin
pkgver=0.17.2
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
sha512sums=('3e06498c95ffac895c4ad68bf1d45db5ed4ea028a068da71473cb7583f23b499f963f59028f5541d6381c265893d47245cd8e62ea76d36c44910f05199f1a407')
sha512sums_aarch64=('4166bb3ec3ef9aacd35928957aff639bca3335ae9ad3ab9b2669755c7189f0fa90e9d76091e7b6620be2b76d7ffce12f4d0cbde585974edd5077da66f416c50c')
sha512sums_armv7h=('d7a2e40cccf712e278157b40090774dab012bf18489a7a7d0b768d70e12c862da1536948ad376f153f55354566128b77fded6604f4243a76611aafd11b6e6f91')
sha512sums_i686=('a07944ea1f81a9c69a9dd1be97d87c50874f7de02f8bb5f0345999afc8fe50ee5845a0a3329934a563447e3bf85c50ff07a3c901c57921a90c7875d45090e0f9')
sha512sums_x86_64=('d111223e692cde1bb0fb014dc76154c241c802eb2f0d60b886b0ed8d61eef03bde97b5d5c06bfc7cf0ec5870d1a85061fdd7867950fd502041d9565db4f45e51')
b2sums=('e60d3ca1ee202b369cb25d7e8d36577907515d448495146b545138281d73bf7f09567c293371ccb7bf7607c602486d3c16c0a0665729dfd78f4f46c02197729b')
b2sums_aarch64=('f6f674022ee2106aa4fead854f714407acbaabe28f4b65bacd0ad6c724558421d1a8284ea1de8d12455064f3ec1e634df6b721ed76ce8934c551f0b2f4e39c7f')
b2sums_armv7h=('9130ec67d7bb3194bf3d3f547518005c777d9f2854cd16c1e3bc30fc0f288486372e40ee90aad6390511c44cafa1c881463069e7bdc219b45a243673b66cff23')
b2sums_i686=('70a94d12a738b0ae77278fafd6e489dd81e4eccf0a10a7ff0f5f914345e3971113b1941c20949febe168ad321fbd4cbb551bb930dc820a3f572769f855095432')
b2sums_x86_64=('93abb6f33915a22726b00e7fea76d6afd0f862649dea9aa7cf44dc3a65717fbe02aa6cb86ceef564b2e14c077f5a2af7cdf7738cfdc6f5e6412993fb3370f1f4')

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
