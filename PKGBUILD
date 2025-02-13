# Maintainer: Goncalo Pereira <goncalo_pereira@outlook.pt>
pkgname=python-kintree
# _name=${pkgname#python-}
_name=Ki-nTree
pkgver=1.2.0
pkgrel=1
pkgdesc="Fast part creation in KiCad and InvenTree"
url="https://github.com/sparkmicro/Ki-nTree"
depends=(
    'python'
    'python-digikey-api'
    'python-flet'
    'python-thefuzz'
    'python-inventree'
    'python-kiutils'
    'python-mouser'
    'python-multiprocess'
    'python-yaml'
    'python-validators'
    'python-wrapt-timeout-decorator'
    'python-cloudscraper'
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
license=('GPL-3.0-or-later')
arch=('any')
source=(
    #     "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "$_name-$pkgver.tar.gz::https://github.com/sparkmicro/Ki-nTree/archive/refs/tags/$pkgver.tar.gz"
    "kintree.png"
    "kintree.desktop")
sha256sums=('c090e40792c451701a8adc00d3e8ccf24a54363270f54a71672da112a3784e5a'
            '46c5a724fab746f094e2ae73d5aa1f7d8b91446d6c841ec3a4f134f64c6277d8'
            '7e95214b781f866ebbbf64510eb956337907f824b0a18691ca0b37766ef817d4')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    chmod 777 -R $pkgdir

    # Desktop file
    install -Dm644 "$srcdir/kintree.desktop" \
        "${pkgdir}/usr/share/applications/kintree.desktop"

    # Icon file
    install -Dm644 "$srcdir/kintree.png" \
        "${pkgdir}/usr/share/pixmaps/kintree.png"
}
