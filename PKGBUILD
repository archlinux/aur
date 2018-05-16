# Maintainer: Morten Linderud <morten@linderud.pw>

pkgbase=python-marshmallow
pkgname=('python-marshmallow' 'python2-marshmallow')
pkgver=2.15.2
pkgrel=1
pkgdesc="A lightweight library for converting complex objects to and from simple Python datatypes."
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
arch=('any')
makedepends=('python' 'python-setuptools'
             'python2' 'python2-setuptools')
checkdepends=('python-tox')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marshmallow-code/marshmallow/archive/${pkgver}.tar.gz")
sha256sums=('8c3e8b5ccfe727e360beb0cb194fe84e10d55f4e7165094b88dd9c5e054cbdd3')

prepare() {
  cp -a marshmallow-$pkgver{,-py2}
}

build() {
    cd "${srcdir}/${pkgbase#python-}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${pkgbase#python-}-${pkgver}-py2"
    python2 setup.py build
}

check(){
    cd "${srcdir}/${pkgbase#python-}-${pkgver}"
    tox -e py3

    cd "${srcdir}/${pkgbase#python-}-${pkgver}-py2"
    tox -e py2
}

package_python-marshmallow() {
    depens=('python')
    optdepends=('python-dateutil: robust datetime deserialization'
                'python-simplejson: precision when (de)serializing Python decimal.Decimal types')
    cd "${srcdir}/${pkgbase#python-}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-marshmallow() {
    depens=('python2')
    optdepends=('python2-dateutil: robust datetime deserialization'
                'python2-simplejson: precision when (de)serializing Python decimal.Decimal types')
    cd "${srcdir}/${pkgbase#python-}-${pkgver}-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
