# Maintainer: isbest <icoderdev@outlook.com>

_pkgname=pyspark
pkgname=python-${_pkgname}
pkgver=3.3.1
pkgrel=1
pkgdesc="Apache Spark Python API"
arch=('any')
url="https://pypi.org/project/pyspark${_pkgname}"
license=('GPL2')
optdepends=('python-pandas' 'python-pyarrow' 'python-psutil' 'python-scikit-learn' 'python-tornado' 'python-typing_extensions' 'python-matplotlib' 'ipython')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e99fa7de92be406884bfd831c32b9306a3a99de44cfc39a2eefb6ed07445d5fa')

build() {
    cd "${_pkgname}-$pkgver"
        python setup.py build
}

package() {
    cd "${_pkgname}-$pkgver"
        export PYTHONHASHSEED=0
        python setup.py install --root="$pkgdir" --optimize=1 --skip-build

        local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
        rm -rf "$pkgdir$site_packages/test"
}
