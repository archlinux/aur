# Maintainer: etcusrvar <etcusrvar at gmail dot com>
# shellcheck shell=bash
# shellcheck disable=SC2034

pkgname=xdgize-git
_="${pkgdir:-}"
_="${srcdir:-}"
_pkgname="${pkgname%-git}"
arch=('any')
backup=()
conflicts=("$_pkgname")
depends=('bash' 'which')
groups=()
install=
license=()
makedepends=('git')
md5sums=('SKIP')
noextract=()
options=()
pkgdesc='A tool that generates minimal wrapper/shim shell scripts around external commands to "XDG"-ize them.'
pkgrel=3
pkgver=0.1.r0.g921d8cf
provides=("$_pkgname")
replaces=()
source=("git+https://github.com/etcusrvar/$_pkgname.git")
url="https://github.com/etcusrvar/$_pkgname"

package() {
	cd "$srcdir/$_pkgname" || exit
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	mkdir -p "$pkgdir/etc/$_pkgname"
	cp -r rules.d "$pkgdir/etc/$_pkgname"
}

pkgver() {
	cd "$srcdir/$_pkgname" || exit
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}
