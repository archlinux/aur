# Maintainer: <trahflow@proton.me>
pkgname=ember-zli
pkgver=2.10.0
githash=e2c70cf
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

sha256sums_x86_64=(cb192ec571426c71710394e2d44ef84abe4b6671f9fe3c146c021d03fab8b82c)
sha256sums_armv7h=(2e5aefd85bab8a69fa226b658ae41f1ec68ff34a9ec5e8ada801e8b99b2d66ee)
sha256sums_aarch64=(b31c212e98a8aa19c0c750b10f82a52ced96ab21a6d8b5c85de7c9fd61dc88d6)

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
