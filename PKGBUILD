# Maintainer: Lost <lostinthestack@proton.me>
pkgname='lost'
pkgver=r8.dc9d92d
pkgrel=1
pkgdesc="Meta package for Mr. Stack's silly hacks."
arch=('x86_64')
url="https://gitlab.com/lostinthestack/lost.git"
license=('UNLICENSE')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	paru -S herbstluftwm \
		feh \
		inkscape \
		gimp \
		htop-vim \

	cd $srcdir/$pkgname
	git clone "$url"
}

package() {
	cd $srcdir/$pkgname

	mkdir -p "${pkgdir}/usr/bin/"
	install -Dm755 "paruz" "${pkgdir}/usr/bin"
}
