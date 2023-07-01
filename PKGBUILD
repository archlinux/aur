# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

_pkgname=polonium
pkgname=kwin-polonium
pkgver=0.5.1
pkgrel=1
pkgdesc='A tiling window manager for KWin 5.27 and up'
arch=('any')
url='https://zeroxoneafour.github.io/polonium/'
license=('MIT')

depends=('kwin')
makedepends=('npm' 'typescript')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/zeroxoneafour/polonium/archive/refs/tags/v$pkgver.tar.gz" '1e608a46dd96ff0ea35bf4de285d3716591d74f7.patch')
sha1sums=('d57d1479523bc09318c2396eca731aa573f7b6d2' '952db69991f4453ab8c7bdb87c39823af4dae866')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i "$srcdir/1e608a46dd96ff0ea35bf4de285d3716591d74f7.patch"
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
