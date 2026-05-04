# Contributor: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: tee < teeaur at duck dot com >

pkgname=smenu
pkgver=1.5.0
pkgrel=1
pkgdesc="A powerful and versatile selection tool for interactive or scripting use"
arch=('x86_64')
url="https://github.com/p-gen/smenu"
license=('MPL-2.0')
depends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('4903990aa870ced8bea48963a5430af170ad2ba3ffc0d3418fd78970fc470a3c')

build() {
    cd "${pkgname}-${pkgver}"
    sed -i '/_XOPEN_SOURCE/s,^,//,' smenu.h
    ./configure --prefix="/usr"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
    find examples/ -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/$pkgname/{}" \;
}
