# Maintainer: dreamscached <dreamscache.d@gmail.com>
_pkgname=undark
pkgname=$_pkgname-git
pkgdesc="Undark - SQLite3 database data recovery tool"
url=https://github.com/inflex/undark

pkgrel=3
pkgver=r3.2e0bd78
arch=(any)

source=(undark::git+https://github.com/inflex/undark#branch=master
        https://raw.githubusercontent.com/inflex/undark/master/LICENSE)
md5sums=(SKIP
        305965de7f896df18ff00622a6987cc9)

makedepends=(ctags)
provides=($_pkgname)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    make
    gzip undark.1
}

package() {
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.1.gz" "$pkgdir/usr/share/man/man1/$_pkgname.1.gz"
}
