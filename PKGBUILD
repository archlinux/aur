# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=dotbot
pkgver=1.19.0
pkgrel=1
pkgdesc="A tool that bootstraps your dotfiles"
arch=('any')
url="https://github.com/anishathalye/dotbot"
license=('MIT')
depends=('python' 'python-yaml')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/anishathalye/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('384546cc1f54046922406fe07e01546d6eba50ba5b8b41a12c05cb313e9d9ee32ad75a874dba958bc1f9f4743367ecb49ce4db35f2db0fc25ba408d55835b0ae')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
