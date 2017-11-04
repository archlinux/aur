# Maintainer: fenuks

pkgname=python-language-server
pkgver=0.10.0
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
md5sums=('b27c1e4da70dc7c903ace6d7d13b84ab')
sha256sums=('a0bb0132950fd12584802fb86cfb4aee86e2e24dab0026e33f6dd987d860f73b')

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
