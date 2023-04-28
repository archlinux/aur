# Maintainer: Miguel Rodrigues <miguelangelorodrigues@enta.pt>
# Author: Amar Al-Zubaidi <https://amarakon.github.io>

_pkgbase="dfm"
pkgname="dmenu-$_pkgbase"
pkgver=1.1.6.g266609a
pkgrel=2
pkgdesc="dmenu-dfm is a simple file manager that uses dmenu"
url="https://github.com/amarakon/dfm"
arch=(any)
license=('AGPL-3')
depends=('dmenu' 'perl' 'xdg-utils')
optdepends=('xclip' 'sesame')
provides=(dmenu-dfm)
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgbase"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

prepare() {
    mv "$srcdir/$_pkgbase/$_pkgbase" "$srcdir/$_pkgbase/$pkgname"
    sed -i "s/\b$_pkgbase\b/$pkgname/g" "$srcdir/$_pkgbase/Makefile"
}

package() {
    cd "$srcdir/$_pkgbase"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
