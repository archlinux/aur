# Maintainer: fenuks

pkgname=python-language-server
pkgver=0.8.0
pkgrel=3
pkgdesc="An implementation of the Language Server Protocol for Python"
arch=("any")
url="https://github.com/palantir/${pkgname}"
license=("MIT")
depends=("python" "python-json-rpc" "python-future" "python-jedi"
    "python-pluggy" "python-pycodestyle" "python-pyflakes" "yapf" "pydocstyle")
# optdepends=("python-language-server-mypy: mypy type checking")
makedepends=("python-setuptools")  
conflicts=("${pkgname}" "${pkgname}-git")
# install=$pkgname.install
source=("https://github.com/palantir/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('434661d8ce325549d6e70704da27128a')
sha256sums=('b278c7fd4a2c34e0038ee1ec4c76e463f6361ba2b2d03666ad43ae33f862f209')

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
