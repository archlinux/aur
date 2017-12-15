pkgname=litecoin-daemon
pkgver=0.14.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer digital currency, official binary release for servers (includes litecoind and litecoin-cli)"

if [ ${CARCH} == 'x86_64' ]; then
  _pkg_arch=x86_64
  sha256sums=(05f409ee57ce83124f2463a3277dc8d46fca18637052d1021130e4deaca07b3c)
else
  _pkg_arch=i686-pc
  sha256sums=(32cb553ac601ed0a7dfa2bbcc848daaec7816733fd66fce4e2e11cc7a12616b2)
fi

source=(
  https://download.litecoin.org/litecoin-$pkgver/linux/litecoin-$pkgver-$_pkg_arch-linux-gnu.tar.gz
)

options=('!strip')
depends=(
  openssl
)

package() {
  cd "$srcdir/litecoin-$pkgver/bin"

  destdir="$pkgdir/opt/$pkgname"

  mkdir -p "$destdir"
  cp * "$destdir"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/litecoin-cli" "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/litecoind" "$pkgdir/usr/bin"
}