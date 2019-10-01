# Maintainer: Bogdan Burlacu <bogdan.burlacu@pm.me>
pkgname=crlibm-git
pkgver=r708.eb30637
pkgrel=1
pkgdesc="A portable, efficient, correctly rounded mathematical library."
arch=('x86_64')
url="https://github.com/taschini/crlibm"
license=('GPL')
depends=(glibc)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/taschini/crlibm.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    ./prepare --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
