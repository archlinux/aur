# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=python-librelane
pkgver=2.4.8
pkgrel=1
pkgdesc="An infrastructure for implementing chip design flows (successor to OpenLane)."
arch=('any')
url="https://github.com/librelane/librelane"
license=('Apache-2.0')

depends=(
    'python'
    'python-psutil'
    'python-semver'
    'python-cloup'
    'python-pyyaml'
    'python-lxml'
    'python-deprecated'
    'python-httpx'
    'python-rapidfuzz'
    'python-rich'
    'tk'
    'klayout'
)

makedepends=(
    'python-setuptools'
    'python-pip'
)
source=("librelane-${pkgver}.tar.gz::https://github.com/librelane/librelane/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('034bf1bd6de5b1ff735412e309c575a96fe1eee0c3f5447b049852f35a8b387c')

build() {
    echo "Building"
}

package() {
    cd "$srcdir/librelane-${pkgver}"

    python -m pip install --upgrade --isolated \
        --root="$pkgdir" --no-deps \
        --no-warn-script-location \
        --root-user-action=ignore .

    PYTHON_SITE_PACKAGES="$pkgdir/usr/lib/python3.13/site-packages"
    find "$PYTHON_SITE_PACKAGES" -name "*.pyc" -delete
    rm -f "$PYTHON_SITE_PACKAGES/librelane-${pkgver}.dist-info/direct_url.json"
    chmod -R g-w "$pkgdir"
}
