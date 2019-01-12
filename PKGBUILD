# Maintainer: b10n <b10n@dittes.nl>
pkgname=powermate-git
pkgver=v5.r20.g3f6459f
pkgrel=2
pkgdesc="A small Linux userspace driver for the Griffin PowerMate."
arch=("x86_64")
url="https://github.com/stefansundin/powermate-linux"
license=("GPL3")
depends=("libpulse")
source=("git+https://github.com/stefansundin/powermate-linux.git"
		"git+https://github.com/cktan/tomlc99.git")
md5sums=("SKIP" "SKIP")

prepare() {
	cd "$srcdir/powermate-linux"
	git submodule init
	git config submodule.tomlc99.url "$srcdir/tomlc99"
	git submodule update
}

pkgver() {
	cd "$srcdir/powermate-linux"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/powermate-linux"
	make
}

package() {
	cd "$srcdir/powermate-linux"
	install -D -m755 powermate "$pkgdir/usr/bin/powermate"
	install -D -m644 60-powermate.rules "$pkgdir/etc/udev/rules.d/60-powermate.rules"
}
