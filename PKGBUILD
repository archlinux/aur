# Contributor: Leo <thinkabit.ukim@gmail.com>
# Contributor: Kevin Daudt <kdaudt@alpinelinux.org>
# Maintainer: fossdd <fossdd@pwned.life>
pkgname=atools
pkgver=20.2.2
pkgrel=1
pkgdesc="Auxilary scripts for abuild"
url="https://gitlab.alpinelinux.org/Leo/atools"
arch=("x86_64" "aarch64" "armv7" "x86" "ppc64le" "s390x")
license=("MIT")
depends=("lua53" "busybox")
makedepends=("scdoc" "redo" "go")
checkdepends=("bats")
source=("$pkgname-$pkgver.tar.gz::https://gitlab.alpinelinux.org/Leo/atools/-/archive/$pkgver/atools-$pkgver.tar.gz")

prepare() {
	find -type f | while read file; do
		sed -E -i "$file" \
			-e '1s|#!/usr/bin/env ash$|#!/bin/busybox ash|'
	done
}

build() {
	cd "$pkgname-$pkgver"
	redo build
}

check() {
	cd "$pkgname-$pkgver"
	redo check
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" redo install
}

sha512sums=('63c95e4b86d99bd913fafe56c89dddd52e11d7bd84e138d236043133b0a7103a9de7393265c5ad387a61218c1f79a458460dca213ff0e9e9a4a65be9313e6580')
