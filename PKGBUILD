# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pip-shims
pkgver=0.7.3
pkgrel=1
pkgdesc="Compatibility shims for pip versions 8 thru current"
url="https://github.com/sarugaku/pip-shims"
license=('ISC')
arch=('any')
depends=('python-pip' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest-runner' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sarugaku/pip-shims/archive/$pkgver.tar.gz"
        $pkgname-pip-22.2.patch::https://github.com/sarugaku/pip-shims/pull/86.patch)
sha512sums=('dddfb99de3578b5b686c055f1c9e157c998ab993355a53038155d390ec37780f96a75fae8dcb72db0e7ef0486f6d6d84fc676233e484abc8f1c28b47d77bdb38'
            '025524336cad457e553e22d3c4cc32939fff9d7cc02ba74906330a0a63dfbeba942ce23834bc4a4e0bf91d0405b4e8999d76f8adee0af73a7cd1c67ad9095255')

prepare() {
  cd pip-shims-$pkgver
  patch -p1 -i ../$pkgname-pip-22.2.patch
}

build() {
  cd pip-shims-$pkgver
  python setup.py build
}

check() {
  cd pip-shims-$pkgver
  python setup.py pytest
}

package() {
  cd pip-shims-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
