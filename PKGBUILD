# Maintainer: einalex <einalex@aegir.space>

pkgname=syscoin
pkgver=4.1.3
pkgrel=3
pkgdesc="A peer-to-peer network based market place on the blockchain. This package provides syscoin binaries: syscoind, syscoin-qt, syscoin-tx, and syscoin-cli"
arch=('x86_64')
url="https://syscoin.org"
license=('MIT')
conflics=('syscoin-git')
provides=('syscoin4')
depends=('boost-libs' 'db4.8' 'dbus' 'harfbuzz' 'libevent' 'libxext' 'protobuf' 'qrencode' 'qt5-base' 'openssl-1.0')
optdepends=('miniupnpc: Firewall-jumping support'
 'zeromq: Allows generating ZMQ notifications')
makedepends=('pkg-config' 'git' 'boost' 'gcc' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
source=("https://github.com/syscoin/syscoin/releases/download/v${pkgver}/syscoin-${pkgver}-x86_64-linux-gnu.tar.gz")
md5sums=('5925e2144c62fe92f3d8541bd52b86c7')

prepare() {
  wget -N -q https://raw.githubusercontent.com/syscoin-core/packaging/master/debian/syscoin-qt.desktop
  wget -N -q https://github.com/syscoin/syscoin/raw/master/share/pixmaps/syscoin256.png
}


package() {
	# install syscoin-qt client
	msg2 'Installing syscoin-qt...'
	install -Dm755 "$srcdir/$pkgname-$pkgver/bin/syscoin-qt" "$pkgdir/usr/local/bin/syscoin-qt"
	install -Dm644 "$srcdir/syscoin256.png" "$pkgdir/usr/share/pixmaps/syscoin256.png"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/syscoin-qt.desktop"

	# install syscoin-daemon
	msg2 'Installing syscoin-daemon...'
	install -Dm755 "$srcdir/$pkgname-$pkgver/bin/syscoind" "$pkgdir/usr/local/bin/syscoind"
	install -Dm755 "$srcdir/$pkgname-$pkgver/bin/sysrelayer.nod" "$pkgdir/usr/local/bin/sysrelayer.nod"
	install -Dm755 "$srcdir/$pkgname-$pkgver/bin/sysgeth.nod" "$pkgdir/usr/local/bin/sysgeth.nod"

	# install syscoin-cli
	msg2 'Installing syscoin-cli...'
	install -Dm755 "$srcdir/$pkgname-$pkgver/bin/syscoin-cli" "$pkgdir/usr/local/bin/syscoin-cli"

	# install syscoin-tx
	msg2 'Installing syscoin-tx...'
	install -Dm755 "$srcdir/$pkgname-$pkgver/bin/syscoin-tx" "$pkgdir/usr/local/bin/syscoin-tx"

	# install syscoin-wallet
	msg2 'Installing syscoin-wallet...'
	install -Dm755 "$srcdir/$pkgname-$pkgver/bin/syscoin-wallet" "$pkgdir/usr/local/bin/syscoin-wallet"

	# install license
	install -D -m644 "$srcdir/$pkgname-$pkgver/include/syscoinconsensus.h" "$pkgdir/usr/local/include/syscoinconsensus.h"
	install -D -m644 "$srcdir/$pkgname-$pkgver/lib/libsyscoinconsensus.so.0.0.0" "$pkgdir/usr/local/lib/libsyscoinconsensus.so.0.0.0"
	ln -s "$pkgdir/usr/local/lib/libsyscoinconsensus.so.0.0.0" "$pkgdir/usr/local/lib/libsyscoinconsensus.so"
	ln -s "$pkgdir/usr/local/lib/libsyscoinconsensus.so.0.0.0" "$pkgdir/usr/local/lib/libsyscoinconsensus.so.0"

	mkdir -p "$pkgdir/usr/share/man/man1"
	install -m 644 -D "$srcdir/$pkgname-$pkgver/share/man/man1/syscoin-cli.1" "$pkgdir/usr/share/man/man1/syscoin-cli.1"
	install -m 644 -D "$srcdir/$pkgname-$pkgver/share/man/man1/syscoind.1" "$pkgdir/usr/share/man/man1/syscoind.1"
	install -m 644 -D "$srcdir/$pkgname-$pkgver/share/man/man1/syscoin-qt.1" "$pkgdir/usr/share/man/man1/syscoin-qt.1"
	install -m 644 -D "$srcdir/$pkgname-$pkgver/share/man/man1/syscoin-tx.1" "$pkgdir/usr/share/man/man1/syscoin-tx.1"
	install -m 644 -D "$srcdir/$pkgname-$pkgver/share/man/man1/syscoin-wallet.1" "$pkgdir/usr/share/man/man1/syscoin-wallet.1"
}
