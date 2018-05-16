# Maintainer: Arnaud Berthomier <oz-cypr-dot-io>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.2.0
pkgrel=2
pkgdesc='Cross-platform library for building Telegram clients'
arch=('i686' 'x86_64')
url='https://core.telegram.org/tdlib'
license=('Boost')
depends=('openssl' 'zlib')
makedepends=('make' 'gcc' 'cmake' 'gperf')
provides=('telegram-tdlib')
conflicts=('telegram-tdlib')
source=("https://github.com/tdlib/td/archive/v$pkgver.tar.gz")
md5sums=('9ab1a9e97d7340dd0c1efd8453467cc7')

build() {
  cd "${srcdir}/td-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd "${srcdir}/td-$pkgver"
  mkdir -p $pkgdir/usr/{lib,include}
  mkdir -p $pkgdir/usr/include/td/telegram
  mkdir -p $pkgdir/usr/include/td/tl

  # Libs
  install -m 644 build/libtdjson.so ${pkgdir}/usr/lib/
  install -m 644 build/libtdjson_static.a ${pkgdir}/usr/lib/
  install -m 644 build/libtdjson_private.a ${pkgdir}/usr/lib/
  install -m 644 build/libtdclient.a ${pkgdir}/usr/lib/
  install -m 644 build/libtdcore.a ${pkgdir}/usr/lib/

  install -m 644 build/tdutils/libtdutils.a ${pkgdir}/usr/lib/
  install -m 644 build/tdactor/libtdactor.a ${pkgdir}/usr/lib/
  install -m 644 build/tdnet/libtdnet.a ${pkgdir}/usr/lib/
  install -m 644 build/sqlite/libtdsqlite.a ${pkgdir}/usr/lib/
  install -m 644 build/tddb/libtddb.a ${pkgdir}/usr/lib/

  # Headers
  install -m 644 td/telegram/td_json_client.h ${pkgdir}/usr/include/td/telegram
  install -m 644 td/telegram/td_log.h ${pkgdir}/usr/include/td/telegram
  install -m 644 build/td/telegram/tdjson_export.h ${pkgdir}/usr/include/td/telegram
  install -m 644 td/telegram/Client.h ${pkgdir}/usr/include/td/telegram
  install -m 644 td/telegram/Log.h ${pkgdir}/usr/include/td/telegram
  install -m 644 td/tl/TlObject.h ${pkgdir}/usr/include/td/tl
}

