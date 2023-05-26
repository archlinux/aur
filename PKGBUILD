# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=psd2svg
pkgname=python-$_name
pkgver=0.2.3
pkgrel=1
pkgdesc='Convert PSD file to SVG file'
arch=(any)
url='https://github.com/kyamagu/psd2svg'
license=('MIT')
depends=('python>=3.6'
         python-future
         python-numpy
         python-pillow
         'python-psd-tools>=1.8.11'
         python-svgwrite)
makedepends=(git python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest python-tox)
source=("git+$url#commit=324b625f8ffdae2ef6374cf85a0982418b3ca399")
b2sums=('SKIP')

prepare() {
    cd $_name
    sed -i 's/py37/py37,py38,py39,py310,py311/g' setup.cfg
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    tox
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
