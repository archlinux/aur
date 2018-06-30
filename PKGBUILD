# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgbase=python-d2to1
pkgname=(python-d2to1 python2-d2to1)
pkgver=0.2.12.post1
pkgrel=4
pkgdesc="Python library that allows using distutils2-like setup.cfg files for a package's metadata with a distribute/setuptools setup.py script"
arch=('any')
url='https://pypi.python.org/pypi/d2to1'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://files.pythonhosted.org/packages/source/d/${pkgname#*-}/${pkgname#*-}-$pkgver.tar.gz)
sha512sums=('89890afc78b21d78f42ef5c920d377cd58075829e025c512d86138d52943ce8b71d1245bf267f76f775c6a69bf81bf9881322bd64b0e75ae088134e6b66f4d2d')

prepare(){
    cp -a ${pkgbase#*-}-$pkgver/ ${pkgbase}2-$pkgver
    find ${pkgbase}2-$pkgver -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
    cd "$srcdir/${pkgbase#*-}-$pkgver"
    python setup.py build

    cd "$srcdir/${pkgbase}2-$pkgver"
    python2 setup.py build
}

package_python-d2to1() {
    depends=('python')

    cd ${pkgbase#*-}-$pkgver/
    python setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-d2to1() {
    depends=('python2')

    cd ${pkgbase}2-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
