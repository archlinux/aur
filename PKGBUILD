# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: PragmaTwice <twice.mliu@gmail.com>
pkgname=kvrocks
pkgver=2.5.1
pkgrel=2
epoch=
pkgdesc="A distributed key value NoSQL database that uses RocksDB as storage engine and compatible with Redis protocol"
arch=(any)
url="https://kvrocks.apache.org/"
license=('Apache')
groups=()
depends=(libunwind openssl)
makedepends=(python git gcc make cmake autoconf automake libtool which)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/apache/kvrocks/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('c6bb750439429a73e17b4c5129b6fdcb59c8182dcb78b3c773da5e432a87c7a1')
validpgpkeys=()

prepare() {
	cd $pkgname-$pkgver
}

build() {
	cd $pkgname-$pkgver
	./x.py build -j$(nproc) -DENABLE_OPENSSL=ON
}

check() {
	cd $pkgname-$pkgver
}

package() {
	cd $pkgname-$pkgver/build
	mkdir -p $pkgdir/usr/bin
	cp kvrocks $pkgdir/usr/bin
	cp kvrocks2redis $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/kvrocks
	cp ../kvrocks.conf $pkgdir/usr/share/kvrocks
	cp ../utils/systemd/kvrocks.service $pkgdir/usr/share/kvrocks
	cp ../LICENSE $pkgdir/usr/share/kvrocks
	cp ../NOTICE $pkgdir/usr/share/kvrocks
	cp -r ../licenses $pkgdir/usr/share/kvrocks
}

