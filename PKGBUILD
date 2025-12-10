# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=python-ciel
pkgver=2.3.1
pkgrel=1
pkgdesc="A tool for managing Process Design Kits (PDKs) for ASIC and FPGA flows."
arch=('any')
url="https://github.com/fossi-foundation/ciel"
license=('Apache-2.0')

depends=(
    'python'
    'python-pyyaml'
    'git'
)

makedepends=(
    'python-setuptools'
    'python-pip'
)

source=("ciel-${pkgver}.tar.gz::https://github.com/fossi-foundation/ciel/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('e19cfb40d4153663a562b8d782483fbf5061b0d84e81acade5254d92c77c21cf')

build() {
    echo "Building"
}

package() {
    cd "$srcdir/ciel-${pkgver}"

    python -m pip install --upgrade --isolated \
        --root="$pkgdir" --no-deps \
        --no-warn-script-location \
        --root-user-action=ignore .

    PYTHON_SITE_PACKAGES="$pkgdir/usr/lib/python3.13/site-packages"
    find "$PYTHON_SITE_PACKAGES" -name "*.pyc" -delete
    rm -f "$PYTHON_SITE_PACKAGES/ciel-${pkgver}.dist-info/direct_url.json"
    chmod -R g-w "$pkgdir"
}
