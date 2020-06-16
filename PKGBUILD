# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Tom van der Lee <t0m.vd.l33@gmail.com>

pkgname=acts
pkgver=1.4.1
pkgrel=1
pkgdesc="Another Calendar-based Tarsnap Script"
arch=("any")
url="https://github.com/alexjurkiewicz/acts"
license=("Public Domain")
conflicts=("acts-git")
depends=("tarsnap"
	 "coreutils"
	 "util-linux")
backup=("usr/lib/systemd/system/acts.timer")
install=$pkgname.install
source=(https://github.com/alexjurkiewicz/acts/archive/v$pkgver.tar.gz)
sha256sums=('0c557a84ce2adecee96e3888f037ee2279a9546ee7f41bb87924c42f0ad8133c')

prepare() {
	cd "$pkgname-$pkgver"

	sed -i "s/^ExecStart=.*$/ExecStart=\/usr\/bin\/acts/g" contrib/systemd/acts.service
}

package() {
	cd "$pkgname-$pkgver"

	mkdir -p "$pkgdir/usr/bin"
	install -m755 acts "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/etc"
	install -m644 acts.conf.sample "$pkgdir/etc"

	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -m644 contrib/systemd/* "$pkgdir/usr/lib/systemd/system"
}

# vim: set ts=8 sw=8 tw=0 noet :
