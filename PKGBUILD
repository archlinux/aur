# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: zwindl on AUR

pkgname=python-pypugjs
pkgver=5.9.11
pkgrel=1
pkgdesc='PugJS syntax adapter for Django, Jinja2 and Mako templates'
url='https://github.com/kakulukia/pypugjs'
depends=(python python-six python-chardet)
makedepends=(python-setuptools)
checkdepends=(python-nose python-django python-jinja python-tornado python-mako)
optdepends=(python-django python-jinja python-tornado python-mako)
license=(MIT)
arch=(any)
# PyPI sdist does not contain tests
source=("https://github.com/kakulukia/pypugjs/archive/v$pkgver/pypugjs-$pkgver.tar.gz")
sha256sums=('8bc013221dd20fcfa886d456c017219b3b506bfb50b967e470a43733f62483e8')

build() {
  cd pypugjs-$pkgver
  python setup.py build
}

check() {
  cd pypugjs-$pkgver
  # -w is needed here as test_cases.py looks into cases/
  PYTHONPATH="$PWD" nosetests -w pypugjs/testsuite
}

package() {
  cd pypugjs-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
