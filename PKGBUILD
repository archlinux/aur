# Maintainer: Brandon Hartshorn <brandonhartshorn at gmail dot com>
pkgname=les-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r83.a3841fd
pkgrel=1
pkgdesc=" A pager program like less"
arch=('x86_64')
url="https://github.com/zorgnax/les"
license=('LGPL')
groups=()
depends=('bash')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('les::git+https://github.com/zorgnax/les.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	# Makefile doesn't create bin dir
	mkdir -p "${pkgdir}/usr/bin"
	make PREFIX="${pkgdir}/usr" install
}
