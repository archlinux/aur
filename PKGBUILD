# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-option-group
pkgname=python-click-option-group
pkgver=0.5.3
pkgrel=2
pkgdesc="Option groups missing in Click"
arch=(any)
url="https://github.com/click-contrib/click-option-group"
license=(BSD)
depends=(python-click)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
# no tests in sdist tarball: https://github.com/click-contrib/click-option-group/issues/39
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("${_name}-v${pkgver}.tar.gz::https://github.com/click-contrib/click-option-group/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9b9861c84d3df206df165bd43dd8ec9544ae646cb0a1cf9d4457a837df9517c952e54aafedf4cf095036ac842b936d7685c6949272d8cef95b28e27ea59c8057')
b2sums=('7917894b34fcfb34955a44b4971a662a4960ba9e04f1709ec9669585b004345dc0021d2f40eec69b999e22a05ee367510c17e8b739ee563f287a046815c27e52')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -vDm 644 {CHANGELOG,README}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
