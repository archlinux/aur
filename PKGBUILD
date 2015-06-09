# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=themer-py-git
pkgver=r3.242f183
pkgrel=2
pkgdesc="Theme generator/manager by coleifer"
arch=("any")
url="https://gist.github.com/coleifer/33484bff21c34644dae1"
license=("GPL")
depends=("python2"
	 "python2-yaml"
	 "python2-jinja"
	 "python2-pillow")
makedepends=("git")
source=("$pkgname::git+https://gist.github.com/33484bff21c34644dae1.git"
	"python2-fix.patch")
sha256sums=('SKIP'
            '4c48ee87d200ab6dfe2456f6e95534bdf0fd2add2335becb6d6145a01bdcb95c')

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 -i "../python2-fix.patch"
}

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$srcdir/themer-py-git"
	install -Dm755 themer.py "$pkgdir/usr/bin/themer.py"	
}

# vim: set ts=8 sw=8 tw=0 noet :
