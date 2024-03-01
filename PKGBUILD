# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=polars
pkgname=boxes-py-git
pkgver=0.1
pkgrel=1
pkgdesc="Boxes.py - laser cutting boxes and more"
arch=("x86_64")
url="https://github.com/florianfesti/boxes"
license=('GPL3')
depends=('python' 'python-affine' 'python-shapely' 'python-markdown' 'python-qrcode')
optdepends=(
    'pstoedit: to export to DXG, gcode or PLT.'
    'python-inkex: for the inkscape extension.')
makedepends=('python-build' 'python-installer')
source=("git+https://github.com/florianfesti/boxes")
b2sums=("SKIP")

build() {
    cd boxes
    python -m build
    python scripts/boxes2inkscape inkex
}

package() {
    cd boxes
    python -m installer -d "$pkgdir" dist/*.whl
    mkdir -p "$pkgdir/usr/share/inkscape/extensions"
    cp -a inkex/*.inx "$pkgdir/usr/share/inkscape/extensions/"
    cp scripts/boxes_proxy.py "$pkgdir/usr/share/inkscape/extensions/"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
