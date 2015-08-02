# Maintainer: Raansu <gero3977 at gmail dot com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m at riseup dot net>
# Clams original code by nochowderforyou <https://github.com/nochowderforyou>

pkgname='clam-git'
_gitname=clams
pkgver=1.4.5.135.gc7b62b5
pkgrel=1
arch=('any')
url="http://www.clamclient.com"
depends=('qt4' 'gcc-libs' 'miniupnpc' 'openssl' 'db4.8' 'protobuf')
makedepends=('pkg-config' 'git' 'boost-libs' 'boost' 'gcc' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
license=('MIT')
pkgdesc="The most widely held crypto-currency ever! This package provides both the GUI QT4 and daemon clients."
provides=('clam-qt' 'clamd')
conflicts=('clam-qt' 'clamd')
source=("git://github.com/nochowderforyou/clams.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  git describe | sed "s/^v//; s/-/./g"
}

build() {
	cd $srcdir/$_gitname
        ./autogen.sh
        ./configure
        make
}


package() {
	# install clam-qt client
	install -D -m755 "$srcdir/$_gitname/src/qt/clam-qt" "$pkgdir/usr/bin/clam-qt"

	# install clam daemon
	install -D -m755 "$srcdir/$_gitname/src/clamd" "$pkgdir/usr/bin/clamd"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
