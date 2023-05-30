# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=kwin-polonium
pkgver=0.4.0
pkgrel=1
pkgdesc='A tiling window manager for KWin 5.27 and up'
arch=('any')
url='https://zeroxoneafour.github.io/polonium/'
license=('MIT')

depends=('kwin')
makedepends=('git' 'npm' 'typescript')

source=("$pkgname::git+https://github.com/zeroxoneafour/polonium#commit=0680f0f36dbf8492457ca6df69b58f1ab1d789a8")
sha1sums=('SKIP')

build() {
    cd "$pkgname"
    [[ -d pkg ]] && make clean
    make src res
}

package() {
    cd "$pkgname"
    install -D -o root -m 755 -d "$pkgdir/usr/share/kwin/scripts"
    cp -r pkg "$pkgdir/usr/share/kwin/scripts/polonium"

    install -D -o root -m 644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
