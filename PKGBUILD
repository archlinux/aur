#!/hint/bash
# Maintainer: alescdb

pkgname=aid-git
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple ChatGPT command line with basic markdown display"
arch=("x86_64")
url="https://github.com/alescdb/aid"
license=('Apache')
makedepends=(dart make)
source=("git+https://github.com/alescdb/aid.git")
provides=("aid=${pkgver%%.r*}")
b2sums=('SKIP')
options=('!strip')

prepare() {
	dart --disable-analytics &>/dev/null
	cd ${pkgname%%-*}
	dart pub get
}

build() {
	cd ${pkgname%%-*}
	mkdir -p ./release
	dart compile exe --output ./release/aid bin/aid.dart
}

package() {
	cd ${pkgname%%-*}
	install -Dm755 ./release/aid -T ${pkgdir}/usr/bin/${pkgname%%-*}
}
