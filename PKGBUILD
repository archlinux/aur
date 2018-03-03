# Maintainer: fenuks

pkgname=python-language-server
pkgver=0.15.1
pkgrel=2
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
md5sums=('deee6fe6776c4f59547939d356004650')
sha256sums=('9a3880af5c2d0aa89e1ed46b9293dac0041a9219ce563f3e0d1ca0031098507d')

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
