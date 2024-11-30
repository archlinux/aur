# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-hangul-romanize
_pkgname=hangul-romanize
pkgver=0.1.0
pkgrel=1
pkgdesc="Romanize Hangul strings.  If you know, you know."
arch=('x86_64')
url='https://github.com/youknowone/hangul-romanize'
license=(BSD)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/1d/5b/006eff88384092edb1f2171e6515d9c28bbc7d99f3f163af67517ea3a382/hangul-romanize-${pkgver}.tar.gz")
sha256sums=('fae69ba181af6e75a86460fd7f57a6b304cd5f1973d8c425ed8602fee2c9276c')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

#check() {
#  cd $_pkgname-$pkgver
# python -m pytest -s -v tests
# tests work, but a not of them need disabling due to external services
#}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
