# Maintainer: aksr <aksr at t-com dot me>
_pkgname=lc
pkgname=${_pkgname}-command-git
pkgver=r36.b6695e2
pkgrel=2
epoch=
pkgdesc="Kent Landfield's \"lc\" command."
arch=('i686' 'x86_64')
url="https://github.com/Keith-S-Thompson/lc"
license=('custom')
makedepends=(git)
install=${pkgname}.install
source=("$pkgname::git+https://github.com/Keith-S-Thompson/lc.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname/src"
	make
}

package() {
	cd "$srcdir/$pkgname/src"
	mkdir -p $pkgdir/opt/${_pkgname}/{bin,man/man1/}
	make MANDIR="$pkgdir/opt/${_pkgname}/man/man1" man
	make BINDIR="$pkgdir/opt/${_pkgname}/bin" install
	install -D -m644 README "$pkgdir/opt/${_pkgname}/doc/README"
}
