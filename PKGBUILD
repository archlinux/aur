# Maintainer: Stella <jens300304@gmail.com>
pkgname=python-ossapi
url="https://github.com/circleguard/ossapi"
pkgver=2.2.2
pkgrel=1
pkgdesc="A python wrapper for the osu! api."
arch=('any')
license=('MIT')
source=(
    "https://github.com/circleguard/ossapi/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('d912d0ca4a714612bc398d25bb04bb64014d8604ef9756bb44e7913417031294')
depends=(
    'python'
    'python-requests'
    'python-requests-oauthlib'
)
makedepends=('python-setuptools')
conflicts=('python-ossapi-git')

build() {
    cd "$srcdir/ossapi-${pkgver}"
    # required due to conflict between this and python-osrparse. can't test anyways.
    rm -rf tests
    python setup.py build
}

package() {
    cd "$srcdir/ossapi-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
