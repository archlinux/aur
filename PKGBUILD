# Maintainer: detiam <dehe_tian at outlook dot com>

pkgname=nodejs-dummy
pkgver=0.0.0
pkgrel=1
pkgdesc='dummy package for nodejs, npm, yarn, pnpm and all packages provided, for use with node version managers like volta'
arch=('any')
url='https://aur.archlinux.org/packages/nodejs-dummy'
license=('GPL-3.0-or-later')
provides=("npm" "yarn" "pnpm" "nodejs" "node-gyp" "nodejs-nopt")

package() {
	mkdir -p "$pkgdir/usr/bin/"
	cat <<- EOF | install -Dm755 /dev/stdin "$pkgdir/usr/bin/node"
		#!/bin/sh
		echo 'Oops, this one is fake.'; exit 1
	EOF
	for bin in npm yarn pnpm node-gyp nopt; do
		ln -s '/usr/bin/node' "$pkgdir/usr/bin/$bin"
	done
}
