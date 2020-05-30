# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: zwindl on AUR

pkgname=python-pypugjs
pkgver=5.9.4
pkgrel=1
pkgdesc='PugJS syntax adapter for Django, Jinja2 and Mako templates'
url='https://github.com/kakulukia/pypugjs'
depends=(python python-six python-chardet)
makedepends=(python-setuptools)
checkdepends=(python-nose python-django python-jinja python-tornado python-mako)
optdepends=(python-django python-jinja python-tornado python-mako)
license=(MIT)
arch=(any)
source=("https://github.com/kakulukia/pypugjs/archive/v$pkgver/pypugjs-$pkgver.tar.gz")
sha256sums=('7e3c660e8fcd2b060a8781f69c3e9325d1167cd78b63ff29c381311042ef5bc7')

build() {
  cd pypugjs-$pkgver
  python setup.py build
}

check() {
  cd pypugjs-$pkgver
  # -w is needed here as test_cases.py looks into cases/
  PYTHONPATH="$PWD" nosetests -v -w pypugjs/testsuite
}

package() {
  cd pypugjs-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
