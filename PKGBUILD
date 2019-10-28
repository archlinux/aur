# Maintainer: Robin Lange <robin.langenc@gmail.com>
# Contributor: Robin Lange <robin.langenc@gmail.com>
pkgname=msi-perkeyrgb
pkgver=2.1
pkgrel=1
pkgdesc="Configuration tool for SteelSeries per-key RGB keyboards on MSI laptops"
arch=('any')
url="https://github.com/Askannz/msi-perkeyrgb"
license=('MIT')
depends=('python' 'hidapi' 'python-setuptools')
makedepends=('python-setuptools')
source=("git+https://github.com/Askannz/msi-perkeyrgb.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {

  cd "${srcdir}/msi-perkeyrgb/"

  python setup.py build

}

package() {

  cd "${srcdir}/msi-perkeyrgb/"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 99-msi-rgb.rules "$pkgdir/etc/udev/rules.d/99-msi-rgb.rules"
  
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

