# Maintainer: <trahflow@proton.me>
pkgname=ember-zli
pkgver=2.9.2
githash=df1e655
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

sha256sums_x86_64=(add87b4bf55767c130800f00ec4af90ac97703a1a915f239958c9e45b84705ca)
sha256sums_armv7h=(f6550b1cc277d04200dcbe7eeb182a05a3c421bae820024b5528c9858f9994cb)
sha256sums_aarch64=(01fd69bdfe41ad57fb60ac01c3289d3827b9d8f082ee126dac76c0abd000119f)

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
