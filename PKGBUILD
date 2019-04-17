# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>

pkgname=mod_sass-git
_name=apache-mod-sass
pkgver=r14.ecc51a0
pkgrel=1
pkgdesc="Automatic on-the-fly SASS compilation to CSS. Also features minifying and caching."
arch=("i686" "x86_64")
license=('https://raw.githubusercontent.com/kjdev/apache-mod-sass/master/LICENSE')
depends=('apr' 'apache' 'libsass')
source=("mod-sass::git+https://github.com/kjdev/apache-mod-sass.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/mod-sass"
	./autogen.sh
    ./configure --prefix=/usr
    make
}

prepare(){
    cd "$srcdir/mod-sass"
	git submodule update --init --recursive
}

pkgver() {
    cd "$srcdir/mod-sass"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package(){
	cd "$srcdir/mod-sass"
	make DESTDIR="$pkgdir" install
}
