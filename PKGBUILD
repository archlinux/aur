# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=acts-git
pkgver=r52.1b732df
pkgrel=1
pkgdesc="Another Calendar-based Tarsnap Script: master branch"
arch=("any")
url="https://github.com/alexjurkiewicz/acts"
license=("Public Domain")
conflicts=("acts")
depends=("tarsnap"
	 "coreutils"
	 "util-linux")
makedepends=("git")
backup=("etc/acts.conf")
install=$pkgname.install
source=("$pkgname::git+https://github.com/alexjurkiewicz/acts.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
	  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$pkgname"

	mkdir -p "$pkgdir/usr/bin"
	install -m755 acts "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/etc"
	install -m644 acts.conf "$pkgdir/etc"
}

# vim: set ts=8 sw=8 tw=0 noet :
