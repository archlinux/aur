# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=unsf-git
pkgver=1.0.r119.gc5e5a8c
pkgrel=1
pkgdesc='Convert SoundFont .sf2 files into GUS-type instrument patches'
arch=('x86_64')
url='https://github.com/psi29a/unsf'
license=('CC0')
depends=('glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/psi29a/unsf.git')
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
        git describe --long --tags --abbrev=7 | sed 's/^unsf-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${pkgname%-git}
	make -f Makefile.linux
}

package() {
	cd ${pkgname%-git}
	install -Dm755 unsf "$pkgdir/usr/bin/unsf"
	install -Dm644 unsf.1 "$pkgdir/usr/share/man/man1/unsf.1"
}
