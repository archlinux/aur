# Maintainer: isbest <icoderdev@outlook.com>

_pkgname=pyspark
pkgname=python-${_pkgname}
pkgver=3.3.0
pkgrel=1
pkgdesc="Apache Spark Python API"
arch=('any')
url="https://pypi.org/project/pyspark${_pkgname}"
license=('GPL2')
depends=('python-future')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7ebe8e9505647b4d124d5a82fca60dfd3891021cf8ad6c5ec88777eeece92cf7')

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
