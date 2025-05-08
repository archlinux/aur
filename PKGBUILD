# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=1.0.0rc2
pkgrel=2
pkgdesc="Series of patches that make curl requests look like Chrome"
arch=(aarch64 armv7h i686 x86_64)
url=https://github.com/lexiforest/curl-impersonate
depends=(glibc)
license=(MIT)
provides=(${pkgname%-bin}-chrome)
conflicts=(${pkgname%-bin}-chrome)
options=(!debug)

source=(https://raw.githubusercontent.com/lexiforest/curl-impersonate/master/LICENSE)
source_aarch64=($url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver.aarch64-linux-gnu.tar.gz)
source_armv7h=($url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver.arm-linux-gnueabihf.tar.gz)
source_i686=($url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver.i386-linux-gnu.tar.gz)
source_x86_64=($url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver.x86_64-linux-gnu.tar.gz)

md5sums=('8d7f9ceab1020bfc9b56031dfbac2968')
md5sums_x86_64=('3698b53b314a6847e9c7f41256f0923e')
md5sums_aarch64=('fc4107a57bf487c771012c015c86800b')
md5sums_armv7h=('5253b5277f3590b43684938aab10c0b8')
md5sums_i686=('2cf6f64417280dae0065a720beeaec0d')

package () {
  mkdir -p "${pkgdir}/usr/lib/"
  find -L -type f -iname "lib*.so*" -print0 | xargs -0r -I@ -- cp -a "@" "${pkgdir}/usr/lib/"
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  chown -R root:root "${pkgdir}/usr/lib/"
}
