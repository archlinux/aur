# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
_pkgname=ti
pkgname=ti-git
pkgver=r137.39cfe91
pkgrel=2
pkgdesc="A simple command line time tracker"
arch=('any')
url="http://ti.sharats.me/"
license=('MIT')
groups=()
depends=('python2' 'python2-yaml' 'python2-colorama')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://github.com/sharat87/ti")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%}"
    sed -i 's/env python$/env python2/' bin/ti
}

package() {
	cd "$srcdir/${pkgname%}"
	mkdir -p $pkgdir/usr/local/bin
    install -m 755 bin/ti $pkgdir/usr/local/bin
}
