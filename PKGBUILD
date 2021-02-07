# Maintainer: neitsab <neitsab at esrevart dot net>

pkgname=signalbackup-tools-git
pkgver=20210128.r0.g563fe38
pkgrel=1
pkgdesc="Tool to work with Signal Backup files"
arch=('x86_64')
url="https://github.com/bepaald/signalbackup-tools"
license=('GPL3')
depends=('openssl' 'sqlite')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/bepaald/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./BUILDSCRIPT.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 ${pkgname%-git} "${pkgdir}/usr/bin/${pkgname%-git}"
  	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README"
}
