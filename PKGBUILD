# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=rfc-get
_pkgname=rfc
pkgver=0.1.1
pkgrel=1
pkgdesc='Command-line utility to view RFCs, man-style'
arch=('any')
url='https://github.com/jforberg/rfc'
license=('BSD')
groups=()
depends=('bash' 'curl' 'awk' 'sed' 'less')
makedepends=('gzip')
source=("https://github.com/jforberg/rfc/archive/${pkgver}.tar.gz"
        'https://www.rfc-editor.org/rfc/rfc-index.txt')
noextract=()
sha1sums=('5d4fcc03d366524fbd82ad93568d3fe7992510b8'
          'SKIP')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    awk -f genindex.awk <../../rfc-index.txt >rfc-index.txt
    gzip -f rfc.1
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 rfc.sh "$pkgdir/usr/bin/rfc"
    install -D -m644 rfc.1.gz "$pkgdir/usr/share/man/man1/rfc.1.gz"
    install -D -m644 rfc-index.txt "$pkgdir/usr/share/rfc-get/rfc-index.txt"
}

