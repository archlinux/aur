# Maintainer: Vladislav Glinsky <cl0ne[at]mithril.org.ua>
# Contributor: Pavel <otchertsov@gmail.com>

pkgname=pidgin-quote-text
pkgver=0.9.4
pkgrel=1
pkgdesc="Quote selected message into the entry area"
arch=('any')
url="https://github.com/pomozoff/quotetext"
license=('GPL2')
depends=('pidgin')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    'replace_internal_h.patch'
    'Makefile'
)
sha256sums=(
    '4272349c0e7dff360c3c7fd8f38b74bb115b9f6b79ef4914a56d6dd044f6ae8b'
    '75bc5ebd98779d9c5e0035f73802399900d98654cc9242832ba0aaaf8bfb22a2'
    '85b8c4218da7867a2c4fe656d1f334483f3c09ac890c43e1d398b38240160f9b'
)

build()
{
    cd "${srcdir}/quotetext-${pkgver}"
    mv "${srcdir}/Makefile" .
    patch -p0 < "${srcdir}/replace_internal_h.patch"
    make
}

package()
{
    cd "${srcdir}/quotetext-${pkgver}"
    make DESTDIR="$pkgdir/usr" install
}
