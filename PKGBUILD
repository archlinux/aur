# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

ghuser=Nudin
ghrepo=LexData
pkgname=python-lexdata
pkgver=0.2
whlver=0.2.0
pkgrel=1
pkgdesc='Python bot framework for Lexemes on Wikidata'
arch=(any)
url="https://${ghuser,,}.github.io/${ghrepo}/"
license=('MIT')
depends=('python'
         'python-requests')
makedepends=('python-pip')
source=("https://github.com/${ghuser}/${ghrepo}/archive/v${pkgver}.tar.gz")
sha256sums=('c9a5abf44281a3fae4c73a17dd3fe3b6dccd7b631bbbad37b8dd38542116a4e5')

build() {
    cd "${srcdir}/${ghrepo}-${pkgver}"
    pip wheel --no-deps --wheel-dir "${srcdir}" .
}

package() {
    pip install --root "${pkgdir}" --no-deps --ignore-installed "${ghrepo}-${whlver:-$pkgver}-py3-none-any.whl"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}/" "${ghrepo}-${pkgver}/LICENSE"
}
