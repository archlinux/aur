# Maintainer: Sandelinos
pkgname=sugarchain-bin
pkgver=0.16.3.24_bloomy
pkgrel=1
pkgdesc="Sugarchain: one-CPU-one-vote, the world's fastest PoW blockchain"
arch=('x86_64')
url="https://sugarchain.org"
license=('MIT')
depends=('boost' 'boost-libs' 'zeromq' 'libevent')
optdepends=('qt5-base')

_signatures="https://github.com/sugarchain-project/sugarchain/releases/download/v${pkgver//_/-}/SHA256SUMS.asc"
source=("https://github.com/sugarchain-project/sugarchain/releases/download/v${pkgver//_/-}/sugarchain-${pkgver//_/-}-x86_64-linux-gnu.tar.gz")
sha256sums=('e972db66eb0e373469dbdb526fefd4e77006ef696adf565974b66c4f81c05e86')

check() {
  msg 'Validating GPG signature...'
  msg2 '(To disable: remove/rename check() function from PKGBUILD)'
  gpg --recv-key B9DDBDE2AAADC421
  curl -sL $_signatures -o SHA256SUMS.asc
  msg2 "Downloading $_signatures"
  gpg --verify 'SHA256SUMS.asc'
  msg2 'GPG signature is valid.'

  msg 'Validating signed checksum of downloaded archive...'
  grep "sugarchain-${pkgver//_/-}-x86_64-linux-gnu.tar.gz" 'SHA256SUMS.asc' | tr -d '\r' | sha256sum -c -
  msg2 'Checksum valid.'
}

package() {
  tar xf "$srcdir/sugarchain-${pkgver//_/-}-x86_64-linux-gnu.tar.gz"
  mkdir -p $pkgdir/usr/bin
  mv $srcdir/sugarchain-0.16.3/bin/* $pkgdir/usr/bin/
}

