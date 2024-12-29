pkgname=pgtap
pkgver=1.3.3
pkgrel=1
pkgdesc='Unit testing framework for PostgreSQL written in PL/pgSQL and PL/SQL'
arch=('any')
url='https://pgtap.org'
license=('custom')
depends=(postgresql)
conflicts=('pgtap-git')
source=("https://github.com/theory/pgtap/releases/download/v${pkgver}/pgTAP-${pkgver}.zip"
        'LICENSE')
sha256sums=('2fe9e8224098c5b4e25532a15a606900e43634b17cd333542460c36f4de6bc66'
            'df49aed7cfc56810a2d82ed8a784929df3a8f3cbe29e7d96b3ea68506b47687b')

build() {
    cd "$srcdir/pgTAP-${pkgver}"
    make
}

package() {
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    cd "$srcdir/pgTAP-${pkgver}"
    make DESTDIR="$pkgdir" install
}
