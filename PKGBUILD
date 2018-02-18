# Maintainer: fenuks

pkgname=python-language-server
pkgver=0.14.0
pkgrel=1
pkgdesc="An implementation of the Language Server Protocol for Python"
arch=("any")
url="https://github.com/palantir/${pkgname}"
license=("MIT")
depends=("python" "python-json-rpc" "python-future" "python-jedi" "python-mccabe"
    "python-pluggy" "python-pycodestyle" "python-pyflakes" "python-rope" "yapf" "pydocstyle")
# optdepends=("python-language-server-mypy: mypy type checking")
makedepends=("python-setuptools")  
conflicts=("${pkgname}" "${pkgname}-git")
# install=$pkgname.install
source=("https://github.com/palantir/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('8791d434ce23146f3c48909aff23d15b')
sha256sums=('5b11bdffe3617d757b8163ba2bd212cbd58eb1d13c483eb214e450bcd3da8af4')

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
