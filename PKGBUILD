# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=libcurl-impersonate-bin
pkgver=1.0.0
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
md5sums=('8d7f9ceab1020bfc9b56031dfbac2968')
md5sums=('8d7f9ceab1020bfc9b56031dfbac2968')
md5sums=('8d7f9ceab1020bfc9b56031dfbac2968')
md5sums=('8d7f9ceab1020bfc9b56031dfbac2968')

package () {
  mkdir -p "${pkgdir}/usr/lib/"
  find -L -type f -iname "lib*.so*" -print0 | xargs -0r -I@ -- cp -a "@" "${pkgdir}/usr/lib/"
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}-chrome.so
  ln -s /usr/lib/${pkgname%-bin}.so.4.8.0 "$pkgdir"/usr/lib/${pkgname%-bin}-chrome.so.4
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  chown -R root:root "${pkgdir}/usr/lib/"
}
