pkgname=imlib2-bpg-git
pkgver=r4.29007a5
pkgrel=1
pkgdesc="Loader for BPG image format for Imlib2"
arch=('i686' 'x86_64')
url="https://github.com/vi/imlib2-bpg"
license=('BSD')
depends=('imlib2')
makedepends=('git' 'libbpg') # linked statically
source=("${pkgname%-git}::git+https://github.com/vi/imlib2-bpg.git")
md5sums=('SKIP')

pkgver(){
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build(){
    cd "$srcdir/${pkgname%-git}"
	make
}

package(){
    cd "$srcdir/${pkgname%-git}"
	install -D -m755 bpg.so $pkgdir/usr/lib/imlib2/loaders/bpg.so
}
