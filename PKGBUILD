# Maintainer: <trahflow@proton.me>
pkgname=ember-zli
pkgver=2.12.0
githash=08b2a60
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

sha256sums_x86_64=(ee1bcaed6c7f47478c8e2a30977b1af6c460e2d6ffed313963d6a7ed626c3abf)
sha256sums_armv7h=(7af45ce0e35471762fff08fca27e70cf966811679daea57b45c306c3dbb50947)
sha256sums_aarch64=(893df980207dc9dbe03a7dbd5175fc416e68cd421a20e6086f3b1a786754c92c)

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
