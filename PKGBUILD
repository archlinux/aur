# Maintainer: Renato Caldas <renato dat calgera ot com>
pkgname=python-cfonts
pkgver=1.4.0
pkgrel=1
pkgdesc="Python port of cfonts"
arch=('any')
url="https://github.com/frostming/python-cfonts"
license=('MIT')
depends=('python-pdm-pep517' 'python-colorama')
makedepends=('python-build' 'python-pip')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/frostming/python-cfonts/archive/refs/tags/v1.4.0.zip")
sha512sums=('31af803243d20cdb3da25b8082c35bb0df9e25f4cb0cb82481aa31ac5910580414fcb0bdef8fb0e3186d736c13750d5544ca6ca5fdd2593af0e837f477997226')

build() {
    cd $pkgname-$pkgver
    python -m build --no-isolation --wheel .
}

check() {
    cd $pkgname-$pkgver
    pytest
}

package() {
    cd $pkgname-$pkgver
    PIP_CONFIG_FILE=/dev/null pip install \
        --root="$pkgdir" \
        --isolated \
        --ignore-installed \
        --no-deps \
        --no-compile \
        --no-warn-script-location \
        dist/${pkgname//-/_}-$pkgver-py2.py3-none-any.whl
    python -O -m compileall "${pkgdir}/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
