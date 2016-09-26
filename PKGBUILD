# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=geth
pkgver=1.4.13
_commit="stable-8f0db69"
pkgrel=1
pkgdesc="The go-ethereum commandline client (geth cli)."
arch=('i686' 'x86_64')
depends=(
  'gmp'
  'glibc'
  'leveldb'
  'readline'
)
conflicts=(
  'geth-git'
  'go-ethereum'
  'go-ethereum-git'
)
provides=('geth')
url="https://bintray.com/karalabe/ethereum/geth/"
license=('GPL')
source=(
  "LICENSE.txt::https://raw.githubusercontent.com/ethereum/go-ethereum/master/COPYING"
)
sha256sums=(
  '48e234e35cf83b4f2543b0fbafcf7d33843378cc1a829654d5fc23f4e1b1e581'
)
source_i686=( # Geth cross builds by Péter Szilágyi (Ethereum Core Developer)
  "${pkgname}-${pkgver}-32.tar.bz2::https://bintray.com/artifact/download/karalabe/ethereum/geth-$pkgver-$_commit-linux-386.tar.bz2"
)
sha256sums_i686=(
  'b7fef3afd4e7d3bdeff8404ce76f9c1a415a00a5bd8eebb51fc4696b565cb583'
)
source_x86_64=( # Geth cross builds by Péter Szilágyi (Ethereum Core Developer)
  "${pkgname}-${pkgver}-64.tar.bz2::https://bintray.com/artifact/download/karalabe/ethereum/geth-$pkgver-$_commit-linux-amd64.tar.bz2"
)
sha256sums_x86_64=(
  '702bbcd920618b6e39e917cf29541fc17e9aed43e6a504be5aec74f25079f205'
)

package() {

  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "$srcdir/geth-$pkgver-$_commit-linux-amd64" "$pkgdir/usr/bin/geth"
  else
    install -Dm755 "$srcdir/geth-$pkgver-$_commit-linux-386" "$pkgdir/usr/bin/geth"
  fi

  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
