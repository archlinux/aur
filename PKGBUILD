# Maintainer: Miguel Rodrigues <miguelangelorodrigues@enta.pt>
# Author: Amar Al-Zubaidi <https://amarakon.github.io>

pkgname=dmenu-dfm
pkgver=1.1
pkgrel=1
pkgdesc="dmenu-dfm is a simple file manager that uses dmenu"
url="https://github.com/amarakon/dfm"
arch=('i686' 'x86_64')
license=('AGPL-3')
depends=('dmenu' 'perl' 'xdg-utils')
optdepends=('xclip')
provides=(dmenu-dfm)
source=($url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('47a88692844ba41d3cb2b649911f3770be7dea62318436be7d12b1b547580288')

prepare() {
    mv "$srcdir/dfm-$pkgver" "$srcdir/$pkgname-$pkgver"
    mv "$srcdir/$pkgname-$pkgver/dfm" "$srcdir/$pkgname-$pkgver/$pkgname"
    sed -i 's/\dfm\b/dmenu-dfm/g' "$srcdir/$pkgname-$pkgver/Makefile"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
