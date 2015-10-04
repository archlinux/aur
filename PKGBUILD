# Maintainer: Yamashita Ren <lemaitre dot lotus at gmail dot com>

# Contributor: Qhor Vertoe <vertoe at qhor dot net>
# Contributor: Noel Maersk <veox at wemakethings dot net>
# Contributor: Mike Lenzen <lenzenmi at gmail dot com>

pkgname=mintcoin-daemon-git
_gitname=mintcoin
pkgver=r130.da098b2
pkgrel=1
pkgdesc="Mintcoin is a peer-to-peer network-based digital currency (git version)."
arch=('i686' 'x86_64')
url="http://www.mintcoinofficial.com/"
license=('MIT')
depends=('boost-libs>=1.46' 'miniupnpc>=1.6' 'openssl')
makedepends=('git' 'make' 'boost')
provides=('mintcoin-daemon')
conflicts=('mintcoin')
source=('git://github.com/MintcoinCommunity/mintcoin.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # make mintcoind daemon
  cd "$srcdir/$_gitname/src"
  make $MAKEFLAGS -f makefile.unix mintcoind
}

package() {
  # install mintcoind daemon
  install -D -m755 "$srcdir/$_gitname/src/mintcoind" "$pkgdir/usr/bin/mintcoind"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
