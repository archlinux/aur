# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.org>
pkgname=kmd-git
_gitname=komodo
author=UoMCS
pkgver=0
pkgrel=1
pkgdesc="Komodo Manchester Debugger"
arch=('i386' 'x86_64')
url="http://brej.org/kmd/"
license=('GPL')
depends=('gtk>=1.2.0' 'glib>=1.2.0')
makedepends=()

provides=('kmd')
conflicts=('kmd')

source=("git://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
    cd "$_gitname"
    echo '".komodo"' > src/dotkomodo.string
}

build() {
	cd "$_gitname"
	./configure --prefix=/usr --build=i386
	make
}

package() {
	cd "$_gitname"
    make DESTDIR="$pkgdir/" install
}
