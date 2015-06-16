# Maintainer: David Parrish <daveparrish@gmail.com>

pkgbase=elements-alpha-git
pkgname=('elements-alpha-cli-git' 'elements-alpha-daemon-git' 'elements-alpha-qt-git')
pkgver=r7804.8865ad9
pkgrel=1
arch=('i686' 'x86_64')
url="http://elementsproject.org/"
license=('MIT')
#depends=()
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf')
source=("${pkgbase}::git+https://github.com/ElementsProject/elements#branch=alpha"
  "elements-alpha.desktop")
sha256sums=('SKIP'
            'dd954b357dc850c637d47763b8c43552bc7995b7062a95f405ab80a5e0ca0602')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgbase}"
  ./autogen.sh
  ./configure --with-incompatible-bdb
  make
}

package_elements-alpha-cli-git() {
  pkgdesc="A collection of Bitcoin experiments - RPC cli client"
  depends=(boost-libs openssl)

  cd "$pkgbase"
  install -Dm755 src/alpha-cli "$pkgdir"/usr/bin/alpha-cli
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_elements-alpha-daemon-git() {
  pkgdesc="A collection of Bitcoin experiments - daemon"
  depends=(boost-libs miniupnpc openssl)

  cd "$pkgbase"
  install -Dm755 src/alphad "$pkgdir"/usr/bin/alphad
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_elements-alpha-qt-git() {
  pkgdesc="A collection of Bitcoin experiments - Qt GUI"
  depends=(boost-libs qt4 miniupnpc qrencode protobuf)
 
  cd "$pkgbase"
  install -Dm755 src/qt/alpha-qt "$pkgdir"/usr/bin/alpha-qt
  install -Dm644 "$srcdir"/elements-alpha.desktop \
    "$pkgdir"/usr/share/applications/elements-alpha.desktop
  install -Dm644 share/pixmaps/bitcoin128.png \
    "$pkgdir"/usr/share/pixmaps/alpha128.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
