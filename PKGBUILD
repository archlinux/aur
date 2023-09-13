# Maintainer: Miguel Rodrigues <miguelangelorodrigues@enta.pt>
# Author: Amar Al-Zubaidi <https://amarakon.github.io>

_pkgbase="dfm"
pkgname="dmenu-$_pkgbase"
pkgver=r128.fba068e
pkgrel=1
pkgdesc="dmenu-dfm is a simple file manager that uses dmenu"
url="https://github.com/amarakon/dfm"
arch=(any)
license=('AGPL-3')
depends=('dmenu' 'perl' 'xdg-utils')
optdepends=('xclip' 'sesame')
provides=(dmenu-dfm)
source=(git+$url.git)
sha256sums=('SKIP')

prepare() {
	mv "$srcdir/$_pkgbase" "$srcdir/$pkgname"
	mv "$srcdir/$pkgname/$_pkgbase" "$srcdir/$pkgname/$pkgname"
	sed -i "s/\b$_pkgbase\b/$pkgname/g" "$srcdir/$pkgname/Makefile"
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
