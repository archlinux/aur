# Maintainer: fenuks

pkgname=python-language-server
pkgver=0.4.1
pkgrel=1
pkgdesc="An implementation of the Language Server Protocol for Python"
arch=("any")
url="https://github.com/palantir/${pkgname}"
license=("MIT")
depends=("python" "python-json-rpc" "python-future" "python-jedi" "python-pycodestyle" "python-pyflakes" "yapf")
# optdepends=("python-language-server-mypy: mypy type checking")
makedepends=("python-setuptools")  
conflicts=("${pkgname}" "${pkgname}-git")
# install=$pkgname.install
source=("https://pypi.python.org/packages/60/8e/f2b7d6b62c3e6abc0de15e07b5ad6549e50d53dd2c008f6d16ae8bd2c761/python-language-server-0.4.1.tar.gz")
md5sums=('df48c624fc2c07dbb3eb049316833f9f')
sha256sums=('671b824352469f9289f396aa134d12faba0a21e2eb04ec7b1315c2b408158cfa')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # remove buildin configparser from requirements or generated entrypoint will fail to find it's distribution
    sed -i "s/'configparser',//g" setup.py
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
