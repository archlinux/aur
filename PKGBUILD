# Maintainer: William Grieshaber <me@zee.li>
# Contributor: portals <portals@gmail.com>

pkgbase=namecoin
pkgname=('namecoin-qt')
pkgver=0.3.80
pkgrel=2
arch=('i686' 'x86_64')
url="http://namecoin.info"
makedepends=('boost' 'qt5-base' 'miniupnpc' 'desktop-file-utils' 'qt5-tools')
license=('MIT')
source=(https://github.com/namecoin/namecoin-legacy/archive/nc$pkgver.tar.gz
	'namecoin-qt.desktop')
sha256sums=('16646061ffe756a7f8b35e8f9e1a5f133cea9239ca68c0d39edcc61fc4010b94'
            'd58f684fb11d8879c5f9fe7ab6c70f1a522d4f76a885e39a2e15157c1d30522e')

build() {
  cd "$srcdir/$pkgbase-nc$pkgver/"
  qmake-qt5 "USE_UPNP=-" # I can't find a way to compile with UPNP
  make

}

package_namecoin-qt() {
  pkgdesc="Namecoin is a decentralized open source information registration and transfer system based on the Bitcoin cryptocurrency."
  depends=(boost-libs qt5-base miniupnpc desktop-file-utils)
  conflicts=(namecoin-qt-git)
  install=namecoin-qt.install
  cd "$srcdir/$pkgbase-nc$pkgver/"
  install -Dm755 namecoin-qt "$pkgdir"/usr/bin/namecoin-qt
  install -Dm644 "$srcdir"/namecoin-qt.desktop \
    "$pkgdir"/usr/share/applications/namecoin-qt.desktop

}

