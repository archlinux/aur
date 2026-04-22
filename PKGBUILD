pkgname=('python-squareline-to-esphome-git')
pkgver='0.1.0'
pkgrel=1
pkgdesc="SquareLine Studio to ESPHome converter"
url="https://github.com/gpambrozio/SquarelineToEsphome"
depends=('python' 'python-pillow' 'python-pyperclip' 'python-yaml')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=('git+https://github.com/gpambrozio/SquarelineToEsphome.git' 'fix-setup.patch')
sha256sums=('SKIP'
            '6b38249bf5bb07013499eacc97e64a97acb720393bb80e6b5c6275a12aabe478')

prepare() {
    cd "${srcdir}/SquarelineToEsphome"
    patch -p0 < "${srcdir}/fix-setup.patch"
}

build() {
    cd "${srcdir}/SquarelineToEsphome"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/SquarelineToEsphome"
    python -m installer --destdir="${pkgdir}" dist/squareline_to_esphome-${pkgver}-py3-none-any.whl
}
