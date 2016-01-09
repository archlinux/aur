# Maintainer: Onishin <onishin at onishin.org>

pkgname=hyperstake-git
_gitname=hyperstake
pkgver=20160901
pkgrel=1
pkgdesc="Peer-to-peer network based digital currency (QT)"
arch=('i686' 'x86_64')
url="https://bitcointalk.org/index.php?topic=678849.0"
license=('MIT')

depends=('qt4' 'gcc-libs' 'miniupnpc' 'openssl' 'db' 'protobuf' 'boost-libs' )
makedepends=('pkg-config' 'git' 'boost-libs' 'boost' 'gcc' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
provides=('hyperstake' 'hyperstake-qt' 'hyperstaked' 'hyperstake-bin' 'hyperstake-daemon')
conflicts=('hyperstake' 'hyperstake-qt' 'hyperstaked' 'hyperstake-bin' 'hyperstake-daemon')
install=hyperstake-git.install
source=("$_gitname::git+https://github.com/hyperstake/HyperStake.git"
 "$pkgname.desktop"
 "$pkgname.install"
)

sha256sums=('SKIP'
            'a061fa16c9380787b4617bdf988605aa2d9c250125dcc7a8e570e211cc89be96'
            'ebf7090ca1202e2c2ccd1aa5bb03e6ac911c458141a1cedda9b41f9c26c2602c')


build() {
  cd "$srcdir/hyperstake"
  ./autogen.sh
  ./configure --with-incompatible-bdb
  make || make || make
}


package() {
  install -Dm644 hyperstake-git.desktop "$pkgdir"/usr/share/applications/hyperstake.desktop
  cd "$srcdir/hyperstake"
  install -Dm755 src/qt/hyperstake-qt "$pkgdir"/usr/bin/hyperstake-qt
  install -Dm644 src/qt/res/icons/hyperstake-128.png  "$pkgdir"/usr/share/pixmaps/hyperstake128.png
}


