pkgname=litecoin-bin
pkgver=0.10.2.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer digital currency, official binary release (includes litecoin-qt and litecoind)"

if [ ${CARCH} == 'x86_64' ]; then
  _bits=64
  sha256sums=(136779e717603002f0a3f0da4f48f38274a286171cff10dd68da067ed82c8b26)
else
  _bits=32
  sha256sums=(eecffd46d3115013b7007d59762eaf819d4ac905ad53edffe164c20d779dfc40)
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
