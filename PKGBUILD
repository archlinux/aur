# Maintainer: robertfoster

pkgbase=python-pyelliptic
pkgname=('python2-pyelliptic' 'python-pyelliptic')
_pkgname=pyelliptic
pkgver=1.5.8
pkgrel=1
pkgdesc="Python OpenSSL wrapper. For modern cryptography with ECC, AES, HMAC, Blowfish..."
arch=(any)
url="https://github.com/yann2192/pyelliptic"
license=('GPL3')
depends=('openssl')
makedepends=('python-setuptools')
source=(https://github.com/yann2192/pyelliptic/archive/$pkgver.tar.gz)

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

sha256sums=('ec23fb3a39a9ad9402354c2ac6c66990e737435365eb313070dd9a76e6849153')
