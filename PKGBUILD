# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-odfdo
_name=${pkgname#python-}
pkgver=3.23.1
pkgrel=1
pkgdesc="Python3 library implementing the ISO/IEC 26300 OpenDocument Format standard."
arch=('any')
url="https://github.com/jdum/odfdo"
license=('Apache-2.0')
depends=(python-lxml)
makedepends=(python-build python-installer python-wheel python-uv-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('e0e04f295e1945f5464cb96ff231d8a606e1013cd9c3bac8193d5af0bde969d53cf099b059bf29912d3095ad5b0bdbbb657d36fcfbce89f039859643a1a9a2da')

build() {
    cd "$_name-$pkgver"
    # relax uv_build version constraint for compatibility with system package
    sed -i 's/uv_build>=0.9.0,<0.12.0/uv_build>=0.9.0/' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
