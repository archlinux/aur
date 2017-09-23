_name=CodeIntel
_pkg=$(tr '[:upper:]' '[:lower:]' <<< $_name)

pkgname=("python-${_pkg}" "python2-${_pkg}")
pkgver=2.0.0b33
pkgrel=1
pkgdesc="Komodo Edit CodeIntel"
url="https://github.com/Kronuz/CodeIntel"
#url="https://github.com/Komodo/KomodoEdit/wiki/290-CodeIntel-OOP-Protocol#set-environment"
makedepends=('python-setuptools' 'python2-setuptools')
license=('MPL 1.1')
arch=('any')
source=('https://pypi.python.org/packages/cc/7c/ace9843f71374185b62b2910410a5777e4e0de5d6651a705339c877091c2/CodeIntel-2.0.0b33.tar.gz')
md5sums=('347d80fd0f859fe58f8d49391a60e530')

prepare() {
#   mv "${srcdir}/${_name}-${pkgver}/"{SilverCity,silvercity}
    cp -a "${srcdir}/${_name}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-codeintel() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-codeintel() {
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
