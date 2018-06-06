pkgname=litecoin-bin
pkgver=0.16.0
pkgrel=1
arch=(i686 x86_64)
url="http://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer digital currency, official binary release (includes litecoin-qt and litecoind)"
install=litecoin-bin.install

if [ ${CARCH} == 'x86_64' ]; then
  _pkg_arch=x86_64
  sha256sums=(5a1dfaea8d70f4d0d61190061631d6ad40cb3662e7718660000c43f564c348e6)
else
  _pkg_arch=i686-pc
  sha256sums=(edda17bdbcba596149cd94d9aa58e5d7975955a94ca9eac30892cbdeaea40ea8)
fi

source=(
  https://download.litecoin.org/litecoin-$pkgver/linux/litecoin-$pkgver-$_pkg_arch-linux-gnu.tar.gz
  litecoin-bin.desktop
  litecoin128.png
)

sha256sums+=(
  addc85926f530590de2e3b2611503a9a8ba0d0614977ce8559ef115d5750e320
  fc2fa6b980a34762a8135168a4446887223ae60b24da54253893ff517992ad94
)

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

  destdir="$pkgdir/opt/$pkgname"

  mkdir -p "$destdir"
  cp * "$destdir"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/litecoin-qt" "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/litecoind" "$pkgdir/usr/bin"

  install -Dm644 "$srcdir"/litecoin-bin.desktop "$pkgdir"/usr/share/applications/litecoin-bin.desktop
  install -Dm644 "$srcdir"/litecoin128.png "$destdir"/litecoin128.png
}
