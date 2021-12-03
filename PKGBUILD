# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: zwindl on AUR

pkgname=python-pypugjs
pkgver=5.9.9
pkgrel=2
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
sha256sums=('2666d50a42b2e0302d92684c75ac396a195276d05a5d775ccbdc2a086aa519b6')

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
