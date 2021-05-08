# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=termtosvg
pkgver=1.1.0
pkgrel=2
pkgdesc='Record terminal sessions as SVG animations'
arch=('any')
url=https://nbedos.github.io/termtosvg/
license=('BSD')
depends=('python-lxml' 'python-pyte')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ed38f1615d7f873e784761d1b406ac73abbd2bbf0c517362f5c2fdc1919d65ee')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  python -m unittest termtosvg.tests.suite
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 man/termtosvg.man.1 "$pkgdir"/usr/share/man/man1/termtosvg.1
  install -Dm644 man/termtosvg-templates.man.5 "$pkgdir"/usr/share/man/man5/termtosvg-templates.5
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
