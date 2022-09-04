# Maintainer: kwrazi <gmail.com>

pkgname=python-zlmdb
_pkgname=zlmdb
pkgver=22.6.1
pkgrel=1
pkgdesc="Object-relational zero-copy in-memory database layer for LMDB."
arch=('any')
url="https://github.com/crossbario/zlmdb"
license=('MIT')
makedepends=('python-setuptools'
             'python-pip'
             'python-wheel')
depends=('python>=3.7'
         'python-cbor2'
         'python-txaio'
         'python-lmdb'
         'python-yaml')
# source=($pkgname-$pkgver.tar.gz::https://github.com/crossbario/zlmdb/archive/v${pkgver}.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/crossbario/zlmdb/tar.gz/refs/tags/v${pkgver})
sha1sums=('737bc596d738ca0df94ce3d763ff54e7feef6e6e')

package(){
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --prefix=/usr
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd ${pkgdir}/${site_packages}
    rm -rfv flatbuffers
}
