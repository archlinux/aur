# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-pdoc
pkgver=12.3.0
pkgrel=1
pkgdesc='A simple program and library to auto generate API documentation for Python modules.'
arch=('any')
url='https://pdoc.dev/'
license=('Unlicense')
depends=('python-jinja' 'python-pygments' 'python-markupsafe')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-hypothesis' 'nodejs')
makedepends=('python-setuptools')
source=("https://github.com/mitmproxy/pdoc/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5bfe47d742a5c8368710497630de4d8419e62e3b95f654dec761d42c3d11cce8b7e242eee67452c303d540411a9fab2f0fb094b7d2d8ac097374a5419cdbe877')

build() {
  cd pdoc-$pkgver
  python setup.py build
}

check() {
  cd pdoc-$pkgver

#  PYTHONPATH="$PWD" python test/test_snapshot.py
  pytest -v
}

package() {
  cd pdoc-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
