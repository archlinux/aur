# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-chameleon
pkgname=('python-chameleon' 'python2-chameleon')
pkgver=3.5
_commit=9c1d8003f5409d4de6bf6d38446491383c6f2d5f
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('custom:BSD' 'ZPL')
url="http://www.pagetemplates.org/"
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$_commit.tar.gz::https://github.com/malthe/chameleon/archive/$_commit.tar.gz")
sha512sums=('85fd98dd69af503c6994fe323d58376796f25ed797d917e9e36bc99f5fed2f53b549b21ed6dbab23af2fce7feae93779c9d482f68092074221226e5eb8436c19')

prepare() {
  mv chameleon-{$_commit,$pkgver}
}

build() {
  cd chameleon-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd chameleon-$pkgver
  python setup.py test
  python2 setup.py test
}

package_python-chameleon() {
  depends=('python')

  cd chameleon-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-chameleon() {
  depends=('python2')

  cd chameleon-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
