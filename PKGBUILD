# Maintainer: Federico Cerruti <cerruti.federico@gmail.com>

pkgname=nuvio-engine-bin
_pkgname=nuvio-engine
pkgver=0.1.7
pkgrel=1
pkgdesc='Cross-platform torrent streaming engine built on libtorrent (prebuilt)'
arch=('x86_64')
url='https://github.com/NuvioMedia/nuvio-engine'
# OpenSSL (Apache-2.0), libtorrent (BSD-3-Clause) and Boost (BSL-1.0) are
# statically linked into the library.
license=('GPL-3.0-or-later' 'Apache-2.0' 'BSD-3-Clause' 'BSL-1.0')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64-$pkgver.tar.gz")
sha256sums_x86_64=('836944200f723d23e6ba2a54d5597b050e6b393267addfa4749241dc49a7309a')

package() {
  cd $_pkgname-linux-$CARCH

  install -Dm755 lib/libnuvio_engine.so.$pkgver -t "$pkgdir/usr/lib"
  ln -s libnuvio_engine.so.$pkgver "$pkgdir/usr/lib/libnuvio_engine.so.0"
  ln -s libnuvio_engine.so.0 "$pkgdir/usr/lib/libnuvio_engine.so"

  install -Dm644 include/nuvio_engine/*.h -t "$pkgdir/usr/include/nuvio_engine"
  install -Dm644 README.md BUILD-INFO.txt -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 licenses/* -t "$pkgdir/usr/share/licenses/$pkgname"
}
