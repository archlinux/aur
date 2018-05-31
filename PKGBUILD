# Maintainer: Raansu <Gero3977@gmail.com>

pkgname=roger-wallet-git
_gitname=TheHolyRogerCoin
pkgver=v0.16.0rc3
pkgrel=1
pkgdesc="The Holy Roger Coin (ROGER), the leading altcoin derived from Litecoin. ROGER is developed with a focus on outing scams and trolling The Fake Roger."
arch=('i686' 'x86_64')
url="https://theholyroger.com"
license=('MIT')
depends=('qt4' 'miniupnpc' 'openssl' 'protobuf')
makedepends=('pkg-config' 'boost-libs' 'boost' 'db4.8' 'gcc' 'gcc-libs' 'git' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool' 'zeromq')
provides=('roger-wallet' 'theholyroger' 'theholyroger-qt' 'theholyrogerd' 'theholyroger-cli' 'theholyroger-tx' 'theholyroger-daemon')
conflicts=('roger-wallet' 'theholyroger' 'theholyroger-qt' 'theholyrogerd' 'theholyroger-cli' 'theholyroger-tx' 'theholyroger-daemon')
source=('git+https://github.com/TheHolyRoger/TheHolyRogerCoin.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags| sed "s/-/./g"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure
   make -j$(nproc)

}

package() {
	# install theholyroger-qt client
	msg2 'Installing theholyroger-qt...'
	install -Dm755 "$srcdir/$_gitname/src/qt/theholyroger-qt" "$pkgdir/usr/bin/theholyroger-qt"
#	install -Dm644 "$srcdir/$_gitname/share/pixmaps/litecoin128.xpm" "$pkgdir/usr/share/pixmaps/litecoin128.xpm"
#	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/$_gitname/contrib/debian-litecoin/litecoin-qt.desktop"
	
	# install theholyroger-daemon
	msg2 'Installing theholyroger-daemon...'
	install -Dm755 "$srcdir/$_gitname/src/theholyrogerd" "$pkgdir/usr/bin/theholyrogerd"
	install -Dm644 "$srcdir/$_gitname/doc/man/theholyroger-qt.1" "$pkgdir/usr/share/man/man1/theholyroger-qt.1"
	install -Dm644 "$srcdir/$_gitname/doc/man/theholyroger-cli.1" "$pkgdir/usr/share/man/man1/theholyroger-cli.1"
	install -Dm644 "$srcdir/$_gitname/doc/man/theholyroger-tx.1" "$pkgdir/usr/share/man/man1/theholyroger-tx.1"
	install -Dm644 "$srcdir/$_gitname/doc/man/theholyrogerd.1" "$pkgdir/usr/share/man/man1/theholyrogerd.1"

	# install theholyroger-cli
	msg2 'Installing theholyroger-cli...'
	install -Dm755 "$srcdir/$_gitname/src/theholyroger-cli" "$pkgdir/usr/bin/theholyroger-cli"

	# install theholyroger-tx
	msg2 'Installing theholyroger-tx...'
	install -Dm755 "$srcdir/$_gitname/src/theholyroger-tx" "$pkgdir/usr/bin/theholyroger-tx"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
