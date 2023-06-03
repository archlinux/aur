# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

_pkgname=polonium
pkgname=kwin-polonium
pkgver=0.4.0
pkgrel=2
pkgdesc='A tiling window manager for KWin 5.27 and up'
arch=('any')
url='https://zeroxoneafour.github.io/polonium/'
license=('MIT')

depends=('kwin')
makedepends=('npm' 'typescript')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/zeroxoneafour/polonium/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('383017eafde6694c835f98a0c9d4a783ca968f7f')

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
