# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=kwin-polonium-git
pkgver=1.0b1.r2.g60dc024
pkgrel=1
pkgdesc='A tiling window manager for KWin 5.27 and up (Git version)'
arch=('any')
url='https://zeroxoneafour.github.io/polonium/'
license=('MIT')

depends=('kwin')
makedepends=('git' 'npm' 'typescript')
conflicts=('kwin-polonium')
provides=('kwin-polonium')

source=("git+https://github.com/zeroxoneafour/polonium")
sha1sums=('SKIP')

pkgver() {
  cd polonium
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd polonium
    [[ -d pkg ]] && make clean
    make src res
}

package() {
    cd polonium
    install -D -o root -m 755 -d "$pkgdir/usr/share/kwin/scripts"
    cp -r pkg "$pkgdir/usr/share/kwin/scripts/polonium"

    install -D -o root -m 644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
