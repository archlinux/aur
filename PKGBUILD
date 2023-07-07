# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: 71e6fd52 <DAStudio.71e6fd52@gmail.com>
# Contributor: Asuka Minato

pkgbase='python-genpac'
pkgname='python-genpac'
_module='genpac'
pkgver=2.1.0
pkgrel=1
pkgdesc="convert gfwlist to pac, custom rules supported."
url="https://github.com/JinnLynn/genpac"
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz)
md5sums=('3d9e9e8c760743a51c02213e247c4c5f')

prepare(){
    # https://github.com/JinnLynn/genpac/pull/47/files
    find . -name "socks.py" -path "*genpac/pysocks*" -exec sed -i "s/from collections import Callable/from collections.abc import Callable/"  {} \;
}

build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python')

    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
