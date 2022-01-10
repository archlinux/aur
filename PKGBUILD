# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname='python-guizero'
_module='guizero'
pkgver=1.3.0
pkgrel=1
pkgdesc="Python module to allow learners to easily create GUIs"
url="https://github.com/lawsie/guizero"
depends=('python-pillow' 'tk')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/lawsie/guizero/master/license.txt')
md5sums=('cb99d284c41da99f1f0ec75201eb8933'
         '9670acd16790b84f21178f2b940a96e2')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    # install license file
    install -Dm644 "$srcdir/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
    # install readme into docdir
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
