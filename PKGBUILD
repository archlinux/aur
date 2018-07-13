# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=soapyremote
_pkgname=SoapyRemote
pkgver=0.4.3
_gitver=soapy-remote-$pkgver
pkgrel=1
pkgdesc="Use any Soapy SDR remotely"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pothosware/SoapyRemote"
license=('custom:Boost')
depends=('soapysdr')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_gitver.tar.gz")
sha256sums=('94146fa0b2f8d658c1e712e0215c7f89163637690fd6f58e75db1f47839f4f2b')

build() {
  mkdir -p "$srcdir"/$_pkgname-$_gitver/build
  cd "$srcdir"/$_pkgname-$_gitver/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"/$_pkgname-$_gitver/build

  make DESTDIR="$pkgdir" install

  install -dm 644 "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 "$srcdir"/$_pkgname-$_gitver/LICENSE_1_0.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
