# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=svgelements
pkgname=python-$_name
pkgver=1.9.5
pkgrel=1
pkgdesc='Svg Elements Parsing'
arch=(any)
url='https://github.com/meerk40t/svgelements'
license=('MIT')
depends=(python)
optdepends=('python-numpy: enable npoint() to do lightning fast linearization for Shapes'
            'python-pillow: load images with PIL/Pillow'
            'python-scipy: quickly provide the exact correct answer for the arc length')
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pillow python-scipy)
optdepends=('python-numpy: fast linearization for Shapes'
            'python-pillow: load images with SVGImage'
            'python-scipy: exact arc length')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('1cec2e059bb532cec015148f289d6f7e9d7c1d58ff11f0b5d847d102aa1a58d292416a5be32a410f0335e74fc9ec2f0d8a2d0e1b05d64ccdb02efee04557b2e4')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    python -m unittest -v
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
