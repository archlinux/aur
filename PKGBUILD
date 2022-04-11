# Maintainer: isbest <icoderdev@outlook.com>

_pkgname=pyspark
pkgname=python-${_pkgname}
pkgver=3.2.1
pkgrel=1
pkgdesc="Apache Spark Python API"
arch=('any')
url="https://pypi.org/project/pyspark${_pkgname}"
license=('GPL2')
depends=('python-future')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('0b81359262ec6e9ac78c353344e7de026027d140c6def949ff0d80ab70f89a54')

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
