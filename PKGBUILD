# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=quarg
pkgver=0.1.2
pkgrel=1
pkgdesc='A command-line search tool for Quassel'
arch=('x86_64')
url='https://oriole.systems/posts/quarg'
license=('MIT')
depends=('python' 'python-dateutil' 'python-sqlalchemy>=1.4')
makedepends=('signify' 'python-setuptools')
optdepends=('python-psycopg2: for PostgreSQL')
source=("https://git.oriole.systems/quarg/snapshot/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.signify::https://git.oriole.systems/quarg/snapshot/${pkgname}-${pkgver}.tar.gz.asc"
        "quarg-release.pub::https://oriole.systems/release.pub")
sha256sums=('1b6610c2417f36b5b1df5208c3c641b8b2ac3283dae87f453801cdc8c4ffb80a'
            'c820f44030dec6ead840c96dea32186fb77aec2e7ea9e2bd3551ccfb57fadedd'
            '9a9b86aabca218831ba3a03878b4473b7c2407be46a5fae11716ba18d2a78918')

prepare() {
	signify -C -p quarg-release.pub -m "${pkgname}-${pkgver}.tar.gz" -x "${pkgname}-${pkgver}.tar.gz.signify"
}

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "${pkgdir}/usr/share/man/man1/" 'quarg.1'
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
