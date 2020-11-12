# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-sphinx-jinja
pkgver=1.1.1
pkgrel=3
pkgdesc='A sphinx extension to include jinja based templates based documentation into a sphinx doc'
arch=(any)
url='https://github.com/tardyp/sphinx-jinja'
license=(MIT)
depends=(python python-docutils python-jinja python-sphinx)
makedepends=(python-setuptools python-pbr)
checkdepends=(python-nose python-sphinx-testing)
source=("https://files.pythonhosted.org/packages/source/s/sphinx-jinja/sphinx-jinja-$pkgver.tar.gz")
sha256sums=('372406fe557be7c3f000ddd0ff130e7bb2d83f47df02e255fd24fe62d81ee143')

build() {
  cd sphinx-jinja-$pkgver
  python setup.py build
}

check() {
  cd sphinx-jinja-$pkgver
  # Running tests with 'nosetests' fails with issues around namespace packages
  python -m nose -v
}

package() {
  cd sphinx-jinja-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
