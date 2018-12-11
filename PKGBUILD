# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=termtosvg
pkgver=0.7.0
pkgrel=1
pkgdesc='Record terminal sessions as SVG animations'
arch=('any')
url=https://nbedos.github.io/termtosvg/
license=('BSD')
depends=('python-lxml' 'python-pyte')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/nbedos/termtosvg/0.7.0/man/termtosvg-templates.man.5')
sha512sums=('8ff48332b4f579049c53975e06af60a6b0007bda38268188509dc85177c9e0262471d5b7116ecd174e244691200a237f95794104a8727be69daec3580830569a'
            'd94b09be05237e4bd09f63a5f946c9db1e510615157d896bf5f782b062f4fe94ba29c86f61e726484a078338cbc85716fd7a49fe2a7822c34821d1a2ad6aabe3')

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
  install -Dm644 ../termtosvg-templates.man.5 "$pkgdir"/usr/share/man/man5/termtosvg-templates.5
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
