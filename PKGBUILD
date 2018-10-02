# Maintainer: Raansu <Gero3977@gmail.com>

pkgbase=roger-wallet-git
_gitname=TheHolyRogerCoin
pkgname=('theholyroger-daemon-git' 'theholyroger-cli-git' 'theholyroger-qt-git' 'theholyroger-tx-git')
pkgver=0.16.3.rogerv3r-0-g4fee9e4
pkgrel=1
pkgdesc="The Holy Roger Coin (ROGER), the leading altcoin derived from Litecoin. ROGER is developed with a focus on outing scams and trolling The Fake Roger."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://theholyroger.com"
license=('MIT')
depends=('qt4' 'miniupnpc' 'openssl' 'protobuf')
makedepends=('pkg-config' 'boost-libs' 'boost' 'db4.8' 'gcc' 'gcc-libs' 'git' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool' 'zeromq')
provides=('roger-wallet' 'theholyroger' 'theholyroger-qt' 'theholyrogerd' 'theholyroger-cli' 'theholyroger-tx' 'theholyroger-daemon')
conflicts=('roger-wallet' 'theholyroger' 'theholyroger-qt' 'theholyrogerd' 'theholyroger-cli' 'theholyroger-tx' 'theholyroger-daemon')
source=(
  'git+https://github.com/TheHolyRoger/TheHolyRogerCoin.git'
  'theholyroger-qt.desktop'
  'theholyrogerd.service'
  'theholyroger.sysusers'
  'theholyroger.tmpfiles'
)
sha256sums=('SKIP'
            '979587970cc682b479eee62188e16c73cf2ebc1faa2f332a1439fd512dd79f7b'
            '2ba073d4d22fd5271885b354f5d98eed46f6c42ab823f930370a29ec65add31d'
            'd4979ec97de07ef507dccc0f0ab15d0330adfaaa0eb7ba50612c8eeced1fbf2c'
            '353d7beb692b288ba455582232f28b1f19c315e1bb740d6fa2881acd6805196d')

pkgver() {
    cd "$_gitname"
    git describe --long --tags | sed 's/-/+/g; s/^v//'
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure
   make -j$(nproc)

}

package_theholyroger-qt-git() {
  pkgdesc="The Holy Roger Coin (ROGER), the leading altcoin derived from Litecoin - Qt"
  depends=(boost-libs desktop-file-utils libevent qt5-base miniupnpc qrencode protobuf zeromq)
  conflicts=(theholyroger-qt)
  provides=(theholyroger-qt)

  cd "$_gitname"
  install -Dm755 src/qt/theholyroger-qt "$pkgdir"/usr/bin/theholyroger-qt
  install -Dm644 "$srcdir"/theholyroger-qt.desktop \
    "$pkgdir"/usr/share/applications/theholyroger.desktop
  install -Dm644 share/pixmaps/bitcoin128.png \
    "$pkgdir"/usr/share/pixmaps/theholyroger128.png
  install -Dm644 doc/man/theholyroger-qt.1 \
    "$pkgdir"/usr/share/man/man1/theholyroger-qt.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_theholyroger-daemon-git() {
  pkgdesc="The Holy Roger Coin (ROGER), the leading altcoin derived from Litecoin - daemon"
  depends=(boost-libs libevent miniupnpc zeromq)
  conflicts=(theholyroger-daemon)
  provides=(theholyroger-daemon)

  cd "$_gitname"
  install -Dm755 src/theholyrogerd "$pkgdir"/usr/bin/theholyrogerd
  install -Dm644 contrib/debian/examples/bitcoin.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/theholyroger.conf"
  install -Dm644 doc/man/theholyrogerd.1 \
    "$pkgdir"/usr/share/man/man1/theholyrogerd.1
  install -Dm644 "$srcdir/theholyrogerd.service" \
    "$pkgdir/usr/lib/systemd/system/theholyrogerd.service"
  install -Dm644 "$srcdir/theholyroger.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/theholyroger.conf"
  install -Dm644 "$srcdir/theholyroger.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/theholyroger.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_theholyroger-cli-git() {
  pkgdesc="The Holy Roger Coin (ROGER), the leading altcoin derived from Litecoin - RPC client"
  depends=(boost-libs libevent)
  conflicts=(theholyroger-cli)
  provides=(theholyroger-cli)

  cd "$_gitname"
  install -Dm755 src/theholyroger-cli "$pkgdir"/usr/bin/theholyroger-cli
  install -Dm644 doc/man/theholyroger-cli.1 \
    "$pkgdir"/usr/share/man/man1/theholyroger-cli.1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_theholyroger-tx-git() {
  pkgdesc="The Holy Roger Coin (ROGER), the leading altcoin derived from Litecoin - Transaction tool"
  depends=(boost-libs openssl)
  conflicts=(theholyroger-tx)
  provides=(theholyroger-tx)

  cd "$_gitname"
  install -Dm755 src/theholyroger-tx "$pkgdir"/usr/bin/theholyroger-tx
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
