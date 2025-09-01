_reponame=libfirm
pkgname="${_reponame}-git"
pkgver=1.22.0.r1142.g114012d
pkgrel=2
pkgdesc='A c-lib for graph-based IR, optimizations and code gen for compilers'
url="https://pp.ipd.kit.edu/firm/"
license=('GPL')
arch=('any')
makedepends=('git')
source=("${_reponame}::git+https://github.com/${_reponame}/${_reponame}.git" 
        libfirm.pc
       )
md5sums=('SKIP'
         '39a7ef0417669487524b95460962f6c7'
        )
options=(staticlibs)
conflicts=('libfirm')
provides=("libfirm=${pkgver}")

pkgver() {
	cd "$_reponame"
	git describe --long --tags --abbrev=7 | sed 's/^libfirm-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_reponame"
}

build() {
	cd "$_reponame"
	
	make
}

package() {
	cd "$_reponame"
	
	make install PREFIX=/usr DESTDIR="$pkgdir"
	install -Dm644 "../${_reponame}.pc" \
	               "${pkgdir}/usr/lib/pkgconfig/${_reponame}.pc"
}
