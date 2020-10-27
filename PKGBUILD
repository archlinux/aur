# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=jedi-language-server
pkgver=0.20.1
pkgrel=1
pkgdesc='Language server for Jedi'
arch=('any')
url=https://github.com/pappasam/jedi-language-server
license=('MIT')
depends=('python-click' 'python-jedi' 'python-pygls')
makedepends=('python-pip' 'python-poetry')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2024e3bf86568a7fff75783569976c9b513fc23a50a2d543b9cc7906aeee3e49')
b2sums=('3a648918eb72e295701f4cdee0d2601e95568b9270f5a4817aff80943c5be65c741b70474e8095a83dd16bb9c13e09020fde5ad1f40109e1e6175e7453bab7ae')

build() {
  cd $pkgname-$pkgver
  poetry build --format wheel
}

package() {
  cd $pkgname-$pkgver
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
}

# vim:set ts=2 sw=2 et:
