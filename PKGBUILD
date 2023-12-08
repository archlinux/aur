# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-fastavro
_name=fastavro
pkgver=1.9.1
pkgrel=1
pkgdesc="Fast read/write of AVRO files"
arch=('x86_64')
url="https://github.com/fastavro/fastavro"
license=('MIT')
depends=('glibc' 'python' 'python-cramjam' 'python-lz4' 'python-snappy' 'python-zstandard')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f37011d66de8ba81b26760db0478009a14c08ebfd34269b3390abfd4616b308f')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
