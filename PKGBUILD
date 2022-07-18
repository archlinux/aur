pkgname=python-labmaze
pkgver=1.0.5
pkgrel=1
pkgdesc="A standalone release of DeepMind Lab's maze generator with Python bindings"
url="https://github.com/deepmind/labmaze"
license=("Apache-2.0")
arch=('x86_64')
depends=('python' 'python-absl' 'python-numpy')
makedepends=('python-setuptools' 'bazel')
source=("https://github.com/deepmind/labmaze/archive/refs/tags/$pkgver.tar.gz"
"fixbuild.patch")
sha256sums=('6f27748abb979f428cc2f6f2c18e51936791a9edf1fa78ff1850d106079eda05'
            '051d8c0ed8ce05562976c182ec4c0c5921f589beb2bfcad2a6eb4fb20a579d1f')

build() {
    cd "${srcdir}/labmaze-$pkgver"
    patch -Np1 -i "${srcdir}/fixbuild.patch"
    python setup.py build
}

package() {
    cd "${srcdir}/labmaze-$pkgver"
    python setup.py install --root "$pkgdir" --optimize=1 --skip-build
}
