# Maintainer: Amish <contact at via dot aur>
# Contributor: Aaron Bishop < erroneous at gmail >

pkgname=qdecoder
pkgver=12.0.8
pkgrel=2
pkgdesc="A simple and powerful CGI library for C/C++ programming language."
arch=('x86_64')
url="https://wolkykim.github.io/qdecoder/"
license=('custom')
depends=()
source=("https://github.com/wolkykim/qdecoder/archive/v${pkgver}.tar.gz"
        "https://github.com/wolkykim/qdecoder/commit/50a674da1cb34c5a086a3e9b88282da6b1782b36.diff")
sha256sums=('3911576ad8766697a9c8c767458edc953ae686eb53cd31d21e38edd7831ed9aa'
            '110a80d8390ecf6789e1f6533a2b118b0f8d04812d17ebea359aceb8508933cf')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < ../50a674da1cb34c5a086a3e9b88282da6b1782b36.diff
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
