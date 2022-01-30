# Maintainer: Stella <jens300304@gmail.com>
pkgname=python-ossapi
url="https://github.com/circleguard/ossapi"
pkgver=2.2.3
pkgrel=1
pkgdesc="A python wrapper for the osu! api."
arch=('any')
license=('MIT')
source=(
    "https://github.com/circleguard/ossapi/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('676b0e53fae80a4a95b3e966f8606c2e1b638112e4cc3d1dedc4fc4c353159ab')
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
