# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>
pkgname=shen-sbcl
pkgver=3.0.3
pkgrel=1
epoch=1
pkgdesc="A portable functional programming language (SBCL port)"
arch=('x86_64')
url="http://www.shenlanguage.org/"
license=('BSD')
depends=('zlib')
makedepends=('sbcl')
provides=('shen')
options=(!strip)
source=(https://github.com/Shen-Language/shen-cl/archive/v$pkgver.tar.gz
        https://github.com/Shen-Language/shen-cl/releases/download/v$pkgver/shen-cl-v$pkgver-linux-prebuilt.tar.gz
)
sha512sums=('da7e3bae598f14b8713c07d880ea7cadd7fe6bf70df4ca8fdaaf2023b5b7f86be232336eea3e5fd1104209e8b97d31d3063e4d59aeb2c2be9b2ee8022270b411'
            '6944180f0662a672e4b6093a7ae5be63d5bdef1d0b633abb1ec18ef289b218c7d26ede784d6c5d1fcef03cf817b0b2a1166a91401c4d0e5fd7f465420e274fef')

build() {
    cd "$srcdir/shen-cl-$pkgver"
    make fetch
    make precompile SHEN="$srcdir/shen"
    make build-sbcl
}

check() {
    cd "$srcdir/shen-cl-$pkgver"
    make test-sbcl
}

package() {
    cd "$srcdir/shen-cl-$pkgver"

    # binary
    install -Dm755 "bin/sbcl/shen" "$pkgdir/usr/bin/shen"

    # documentation
    install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
    cp -a kernel/doc/*.md "$pkgdir/usr/share/doc/$pkgname"

    # license
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
