# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-ossapi
url="https://github.com/circleguard/ossapi"
pkgver=2.2.0
pkgrel=1
pkgdesc="A python wrapper for the osu! api."
arch=('any')
license=('MIT')
source=(
    "https://github.com/circleguard/ossapi/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    'a60b586bb96ee11c8be29393db2d40149799dabe71a0e7d760c720e0da2159fd'
)
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
