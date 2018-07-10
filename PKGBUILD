# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=soapyremote
pkgver=0.4.3
_gitver=soapy-remote-$pkgver
pkgrel=1
pkgdesc="Use any Soapy SDR remotely"
arch=(any)
url="https://github.com/pothosware/SoapyRemote"
license=('custom:Boost')
depends=('soapysdr')
makedepends=('cmake')
provides=('soapyremote')
conflicts=('soapyremote')
source=("$pkgname-$pkgver::$url/archive/$_gver.tar.gz"
	'git_revision.patch')
sha256sums=('94146fa0b2f8d658c1e712e0215c7f89163637690fd6f58e75db1f47839f4f2b'
	    '93a2a6d031fb50156ed7de00658fe082ef802ad7900e5336f37b897588fe869c')

_srcdir=SoapyRemote-$_gitver

#prepare() {
#  sed -i "s/SOURCE_FOLDER/$_sdir/g" git_revision.patch
#  patch -p0 < git_revision.patch
#}

build() {
  mkdir -p "$srcdir"/$_srcdir/build
  cd "$srcdir"/$_srcdir/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"/$_srcdir/build

  make DESTDIR="$pkgdir" install

  install -dm 644 "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 "$srcdir"/$_srcdir/LICENSE_1_0.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
