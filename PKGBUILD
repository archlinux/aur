pkgname=litecoin-bin
pkgver=0.10.4.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer digital currency, official binary release (includes litecoin-qt and litecoind)"

if [ ${CARCH} == 'x86_64' ]; then
  _bits=64
  sha256sums=(2d98c30ab2ab1c1846fe59f162c297485a81f94e87ae43d60582c6559a3d4e60)
else
  _bits=32
  sha256sums=(af9740393a35103ca3e5256bae082975894fa12f0d416438f73d2b8f1372aed2)
fi
source=(https://download.litecoin.org/litecoin-$pkgver/linux/litecoin-$pkgver-linux$_bits.tar.gz)

options=('!strip')
depends=(
  bzip2
  expat
  fontconfig
  freetype2
  glib2
  libffi
  libice
  libpng
  libsm
  libx11
  libxau
  libxcb
  libxdmcp
  libxext
  libxrender
  openssl
  pcre
  qt4
  util-linux
  zlib
) 

package() {
  cd "$srcdir/litecoin-$pkgver/bin"

  mkdir -p "$pkgdir/opt/$pkgname"
  cp * "$pkgdir/opt/$pkgname"
  # chmod -R 755 "$pkgdir/opt/$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/litecoin-qt" "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/litecoind" "$pkgdir/usr/bin"
}
