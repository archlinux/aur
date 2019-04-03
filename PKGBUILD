# Maintainer: robertfoster

pkgbase=python-pyelliptic
pkgname=('python2-pyelliptic' 'python-pyelliptic')
_pkgname=pyelliptic
pkgver=2.0.1
pkgrel=1
pkgdesc="Python OpenSSL wrapper for ECC (ECDSA, ECIES), AES, HMAC, Blowfish, ..."
arch=(any)
url="https://github.com/radfish/pyelliptic"
license=('GPL3')
depends=('openssl')
makedepends=('python-setuptools')
source=(https://github.com/radfish/pyelliptic/archive/$pkgver.tar.gz)

build() {
    cp -a ${_pkgname}-${pkgver}{,-py2}

    cd ${_pkgname}-${pkgver}
    python setup.py build

    cd ../${_pkgname}-${pkgver}-py2
    python2 setup.py build
}

package_python-pyelliptic(){
    provides=("$pkgname=$pkgver")
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --skip-build
}

package_python2-pyelliptic(){
    provides=("$pkgname=$pkgver")
    cd ${_pkgname}-${pkgver}-py2
    python2 setup.py install --root="$pkgdir" --skip-build
}

sha256sums=('840ad6f5e79c633e1de79fb08be78bf76fe07a7f260905eea31efb5ddf00180d')
