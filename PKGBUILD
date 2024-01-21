# Maintainer: Goncalo Pereira <goncalo_pereira@outlook.pt>
pkgname=python-kintree
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=4
pkgdesc="Fast part creation in KiCad and InvenTree"
url="https://github.com/sparkmicro/Ki-nTree"
depends=(
    'python'
    'python-digikey-api'
    'python-flet-0-7-x'
    'python-thefuzz'
    'python-inventree'
    'python-kiutils'
    'python-mouser'
    'python-multiprocess'
    'python-pyaml'
    'python-validators'
    'python-wrapt-timeout-decorator'
)
makedepends=(python-build python-installer python-wheel)
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "kintree.png"
        "kintree.desktop")
sha256sums=('781f647df37d935cee6fba6535e166caaa9f496f0c668e9b61ceccda65310c20'
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
    install -Dm644 "../${_name}.desktop"\
                 "${pkgdir}/usr/share/applications/${_name}.desktop"

    # Icon file
    install -Dm644 "../kintree.png"\
                 "${pkgdir}/usr/share/pixmaps/${_name}.png"
}