# Maintainer: fenuks

pkgname=python-language-server
pkgver=0.9.0
pkgrel=1
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
md5sums=('1ac87c9b6624498997bfe841c937d8af')
sha256sums=('206b00ce2c5e5797e0ec6d6b02dad6bd7442a565f23440a19b048ba5993b6743')

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
