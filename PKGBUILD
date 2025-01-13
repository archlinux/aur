# Maintainer: <trahflow@proton.me>
pkgname=ember-zli
pkgver=2.10.2
githash=a6adb5b
pkgrel=1
pkgdesc="Interact with EmberZNet-based adapters using zigbee-herdsman 'ember' driver"
url="https://github.com/Nerivec/ember-zli"
license=('GPL-3.0')
arch=(x86_64 armv7h aarch64)
depends=(nodejs)
makedepends=()

source_x86_64=("https://github.com/Nerivec/ember-zli/releases/download/v$pkgver/ember-zli-v$pkgver-$githash-linux-x64.tar.gz")
source_armv7h=("https://github.com/Nerivec/ember-zli/releases/download/v$pkgver/ember-zli-v$pkgver-$githash-linux-arm.tar.gz")
source_aarch64=("https://github.com/Nerivec/ember-zli/releases/download/v$pkgver/ember-zli-v$pkgver-$githash-linux-arm64.tar.gz")

sha256sums_x86_64=(94d18a5938ec5220a7e8fc4e581c7a3bd2e8420f8ce581ab72b6eb27ec100b54)
sha256sums_armv7h=(8bdb0cd79b3e5a6178199d01f56bd8594689062b67a76ac671283ff88b0c89d7)
sha256sums_aarch64=(19f0ef8583be33e272f85d799f909695a3ea25077970047e5ffe40f6dfe00241)

prepare() {
	echo "$srcdir/ember-zli"
	cd "$srcdir/ember-zli/bin"
	# remove bundled nodejs and windows commands
	rm dev.cmd dev.js ember-zli.cmd node 
	cd "$srcdir"
}

package() {
	local targetdir="${pkgdir}/opt/ember-zli"
	# create directories
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/opt"
	# copy files
	cp -a "$srcdir/ember-zli/" "$targetdir"
	chmod -R 755 "$targetdir"
	# symlink executable
	ln -s "/opt/ember-zli/bin/ember-zli" "${pkgdir}/usr/bin/ember-zli"
}
