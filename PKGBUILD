# Maintainer:Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: kyrenaios <kyrenaios at protonmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: shmilee
pkgname=('python-mistune2')
_pyname='mistune'
pkgver=2.0.5
pkgrel=1
pkgdesc="A fast yet powerful Python Markdown parser with renderers and plugins"
arch=('any')
url="https://github.com/lepture/mistune"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
conflicts=('python-mistune')
provides=("python-mistune=$pkgver")
source=("https://github.com/lepture/mistune/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ca1cb685e55550d8adc421cec1bb5359895e04bc80259eb0bdc5b554669758e92d3f10cdd4bd01a15ca9aeeca62f9c8813a14101db0281b9a93eeecbff496aa0')
b2sums=('fbece6ecb32003b40772b5772eb0415d1ae3654a52625578ff92daa4ed8df38758a6e725ddda86b2f7848406942454e09e52dca6583444f03769bd4911a4c5aa')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_pyname-$pkgver
  pytest -vv
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
