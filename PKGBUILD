# Maintainer: Samiul Quoreshi Sourav <sourav at l3v11.eu.org>
# Contributor: Oscar Latorre <oscarlatorre7896@gmail.com>

pkgname=stegsnow
pkgver=20130616
pkgrel=8
pkgdesc="Conceal messages in ASCII text by appending whitespace to the end of lines"
arch=('x86_64')
url="https://www.darkside.com.au/snow"
license=('Apache-2.0')
depends=('glibc')
conflicts=('stegsnow-git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://salsa.debian.org/pkg-security-team/stegsnow/-/archive/debian/${pkgver}-${pkgrel}/stegsnow-debian-${pkgver}-${pkgrel}.tar.gz")
sha256sums=('acec2226d65508c81e7204874ae0aa4186d3c1ec3b1ba4c3f6a0919e52ceeda2')

prepare() {
    cd "$srcdir/stegsnow-debian-${pkgver}-${pkgrel}"
    while read -r patch; do
        [[ -z "$patch" ]] && continue
        patch -Np1 -i "debian/patches/$patch"
    done < debian/patches/series
}

build() {
    cd "$srcdir/${pkgname}-debian-${pkgver}-${pkgrel}"
    make
}

package() {
    cd "$srcdir/stegsnow-debian-${pkgver}-${pkgrel}"
    install -Dm755 snow "$pkgdir/usr/bin/$pkgname"
    install -Dm644 snow.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 debian/README.Debian "$pkgdir/usr/share/doc/$pkgname/README"
}
