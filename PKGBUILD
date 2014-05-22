# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
pkgbasepython-d2to1
pkgname=(python-d2to1 python2-d2to1)
pkgver=0.2.11
pkgrel=2
pkgdesc="Python bindings to the OpenStack Identity API (Keystone)"
arch=(any)
url=https://pypi.python.org/pypi/d2to1
license=(BSD)
makedepends=(python2-setuptools python-setuptools)
source=(http://pypi.python.org/packages/source/d/${pkgname#*-}/${pkgname#*-}-$pkgver.tar.gz)
sha256sums=('90ed54749cdee1aab8daae720e3559dca97a47d071fa7f0592e75ffe869911e7')
sha512sums=('5a932d56e1464b8d5f2fe212e2b9551251f90a9f9087b73d3d78525eeba6f696455db409b37490c94de8e9555be9bef893074de8ea628977f45200800be5f4f5')

prepare(){
    cp -a ${pkgbase#*-}-$pkgver/ ${pkgbase}2-$pkgver
    find ${pkgbase}2-$pkgver -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
    cd $srcdir/${pkgbase#*-}-$pkgver
    python setup.py build
    cd $srcdir/${pkgbase#*-}2-$pkgver
    python2 setup.py build
}

package_python-pbr() {
    cd ${pkgbase#*-}-$pkgver/
    python setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
package_python2-pbr() {
    cd ${pkgbase#*-}2-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
