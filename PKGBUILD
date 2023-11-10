# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-fastavro
_name="${pkgname#python-}"
pkgver=1.9.0
pkgrel=1
pkgdesc="Fast read/write of AVRO files"
arch=('x86_64')
url="https://github.com/fastavro/fastavro"
license=('MIT')
depends=('glibc' 'python-cramjam' 'python-lz4' 'python-snappy' 'python-zstandard')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('71aad82b17442dc41223f8351b9f28a60dd877a8e5a7525eaf6342f45f6d23e1')

build(){
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package(){
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
