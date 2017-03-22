# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=blpapi_cpp
pkgver=3.10.7.1
pkgrel=1
pkgdesc="The Bloomberg API (BLPAPI) is a C++ library to comsume Bloomberg data."
arch=('i686' 'x86_64')
url="http://www.bloomberglabs.com/"
license=('custom')
depends=()
source=("https://bloomberg.bintray.com/BLPAPI-Experimental-Generic/blpapi_cpp_$pkgver-linux.tar.gz")
sha256sums=('667cdc70cbad56759c0f2293f75e7d873a90130cd689fcdeee9c422beb03d2dc')

package() {
  cd "$srcdir/${pkgname}_$pkgver"
  local suffix
  if [ "$CARCH" = "i686" ]; then
      suffix="32"
  else
      suffix="64"
  fi
  install -Dm755 "Linux/libblpapi3_$suffix.so" "$pkgdir/usr/lib/libblpapi3_$suffix.so"
  install -Dm644 include/* -t "$pkgdir/usr/include"
  install -Dm644 doc/html/* -t "$pkgdir/usr/share/doc/$pkgname/html"
  install -Dm644 doc/ChangeLog.txt "pkgdir/usr/share/doc/ChangeLog.txt"

  # copy license to proper directory
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
