# Maintainer: <trahflow@proton.me>
pkgname=ember-zli
pkgver=2.9.1
githash=6f85ecb
pkgrel=1
pkgdesc="Interact with EmberZNet-based adapters using zigbee-herdsman 'ember' driver"
url="https://github.com/Nerivec/ember-zli"
license=('GPL-3.0')
arch=(x86_64 armv7h aarch64)
depends=(nodejs)
makedepends=()

source_x86_64=("https://github.com/Nerivec/ember-zli/releases/download/v$pkgver/ember-zli-v$pkgver-$githash-linux-x64.tar.gz")
source_armv7h=("https://github.com/Nerivec/ember-zli/releases/download/v$pkgver/ember-zli-v$pkgver-$githash-linux-arm.tar.gz")
source_armv7h=("https://github.com/Nerivec/ember-zli/releases/download/v$pkgver/ember-zli-v$pkgver-$githash-linux-arm64.tar.gz")

sha256sums_x86_64=(a40407ee8c994e27588f4108923d8f08a9a09aaae9dbdd2a5a0abbfeff2b44cb)
sha256sums_armv7h=(2194264641b22090d9b702f643cfba55e9aaec5300ff22b184345561975e06d2)
sha256sums_aarch64=(065fea75d63e42a340f28eb1e733cd071f1eb589dbca9e8ab9f40345d3235e24)

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
