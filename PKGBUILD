# Maintainer: aksr <aksr at t-com dot me>
pkgname=dblp-refer-git
pkgver=r9.9dc9c5f
pkgrel=1
pkgdesc='Convert DBLP search results to refer records'
arch=('i686' 'x86_64')
url='https://github.com/aligrudi/dblp'
license=('ISC')
makedepends=('git')
optdepends=('neatrefer-git: refer preprocessor for neatroff')
source=("$pkgname::git+https://github.com/aligrudi/dblp.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i -e 's!>dblp.out!>/tmp/dblp.out!g' \
	       -e 's!^\./dblp <dblp.out!dblp-refer </tmp/dblp.out!g' dblp.sh
	sed -i 's/\.\/dblp/dblp-refer/g' README
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 dblp $pkgdir/usr/bin/dblp-refer
	install -D -m755 dblp.sh $pkgdir/usr/bin/dblp-refer.sh
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}
