# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-lazy-object-proxy
pkgname=(python-lazy-object-proxy python2-lazy-object-proxy)
pkgver=1.5.0
pkgrel=1
pkgdesc='A fast and thorough lazy object proxy'
arch=('x86_64')
url="https://github.com/ionelmc/python-lazy-object-proxy"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-benchmark' 'python-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ionelmc/python-lazy-object-proxy/archive/v$pkgver.tar.gz")
sha512sums=('150f2fc240611175697ad638cf85f88bed6534b13cd39ea2d5103292b1c7a1825918738a6ad689940ce9f906f064077ad1fe2b036f6dff3f6f5d31bf43d817d7')

prepare() {
  cp -a python-lazy-object-proxy-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/python-lazy-object-proxy-$pkgver
  python setup.py build

  cd "$srcdir"/python-lazy-object-proxy-$pkgver-py2
  python2 setup.py build
}

check() {
  cd python-lazy-object-proxy-$pkgver
  python setup.py pytest --addopts --ignore=src
}

package_python-lazy-object-proxy() {
  depends=("python")

  cd python-lazy-object-proxy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-lazy-object-proxy() {
  depends=("python2")

  cd python-lazy-object-proxy-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
