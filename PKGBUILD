# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

_pkgname=polonium
pkgname=kwin-polonium
pkgver=1.1
pkgrel=1
pkgdesc='A tiling window manager for KWin 5.27 and up'
arch=('any')
url='https://zeroxoneafour.github.io/polonium/'
license=('MIT')

depends=('kwin')
makedepends=('git' 'npm' 'typescript')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/zeroxoneafour/polonium/archive/refs/tags/v$pkgver.tar.gz"
        'kwin-api::git+https://github.com/zeroxoneafour/kwin-api.git#commit=8fc04bd086a1445ea67783eaa33517b70e01c063')
sha1sums=('333c52d47b7e7ec9f7fcc5b0c9ca0024d7a9eeb7'
          'b85280ef82a0b6291cffa03468c7efa2bf633f0d')

prepare() {
    cd "$_pkgname-$pkgver"
    rm -d kwin-api
    ln -s "$srcdir/kwin-api" kwin-api
}

build() {
    cd "$_pkgname-$pkgver"
    [[ -d pkg ]] && make clean
    make src res
}

package() {
    cd "$_pkgname-$pkgver"
    install -D -o root -m 755 -d "$pkgdir/usr/share/kwin/scripts"
    cp -r pkg "$pkgdir/usr/share/kwin/scripts/polonium"

    install -D -o root -m 644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
