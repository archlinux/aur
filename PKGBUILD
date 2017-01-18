# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=liquidprompt-git
pkgver=v_1.9.r6.gdbe3c15
pkgrel=2
pkgdesc="A useful adaptive prompt for Bash & Zsh"
arch=("any")
url="https://github.com/nojhan/liquidprompt"
license=("AGPLv3")
conflicts=("liquidprompt")
replaces=("liquidprompt-devel-git")
depends=("ncurses"
	 "grep"
	 "gawk"
	 "sed"
	 "procps-ng"
	 "coreutils")
optdepends=("acpi: Battery and temperature status"
	    "lm_sensors: Temperature status")
makedepends=("git")
source=("$pkgname::git+https://github.com/nojhan/liquidprompt.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
	  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$pkgname"
	install -Dm755 liquidprompt "$pkgdir/usr/bin/liquidprompt"
	install -Dm644 liquidpromptrc-dist "$pkgdir/etc/liquidpromptrc"
}

# vim: set ts=8 sw=8 tw=0 noet :
