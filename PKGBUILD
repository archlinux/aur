# Maintainer: Yonggang Li <gnaggnoyil@gmail.com>
# Contributor: isbest <icoderdev@outlook.com>

_pkgbasename=pyspark
pkgname=python-${_pkgbasename}
pkgver=3.5.1
pkgrel=1
pkgdesc="Apache Spark Python API"
arch=('any')
url="https://pypi.org/project/${_pkgbasename}"
license=('Apache-2.0')
depends=('python-py4j>=0.10.9.7')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'python-pandas>=1.0.5'
    'python-pyarrow>=4.0.0'
    'python-numpy>=1.15'
    'python-grpcio>=1.48'
    'python-grpcio<1.57'
    # Not avaliable in offical repo or AUR yet.
    #'python-grpcio-status>=1.48'
    #'python-grpcio-status<=1.57'
    'python-googleapis-common-protos==1.56.4'
)
source=(
    "https://pypi.org/packages/source/${_pkgbasename:0:1}/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz"
)
sha256sums=('dd6569e547365eadc4f887bf57f153e4d582a68c4b490de475d55b9981664910')

build() {
    cd "${srcdir}/${_pkgbasename}-${pkgver}"
	env PYTHONHASHSEED=0 python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgbasename}-${pkgver}"
	env PYTHONHASHSEED=0 python -m installer --destdir="${pkgdir}" dist/*.whl
	# Separate license file is not needed since this is an Apache project which
	# uses vanilla apache-2.0 license file in apache offical website
}
