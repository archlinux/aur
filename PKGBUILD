# Maintainer: Miguel Rodrigues <miguelangelorodrigues@enta.pt>
# Author: Amar Al-Zubaidi <https://amarakon.github.io>

_pkgbase="dfm"
pkgname="dmenu-$_pkgbase"
pkgver=1.2
pkgrel=1
pkgdesc="dmenu-dfm is a simple file manager that uses dmenu"
url="https://github.com/amarakon/dfm"
arch=(any)
license=('AGPL-3')
depends=('dmenu' 'perl' 'xdg-utils')
optdepends=('xclip' 'sesame')
provides=(dmenu-dfm)
source=($url/releases/download/$pkgver/dfm-v$pkgver.tar.gz)
sha256sums=('a181abca14d42de3bd5d0b7dab20806982d9f406dc307eff46402b6887ba25eb')

prepare() {
    mv "$srcdir/$_pkgbase" "$srcdir/$pkgname"
    sed -i "s/\b$_pkgbase\b/$pkgname/g" "$srcdir/Makefile"
}

package() {
    cd "$srcdir"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
