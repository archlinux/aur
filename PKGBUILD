# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=nautilus-terminal
pkgver=4.1.0
pkgrel=1
pkgdesc="Embedded terminal for Nautilus"
arch=(any)
url="https://github.com/flozz/nautilus-terminal"
license=(GPL3)
depends=('nautilus<43' 'python-nautilus<4' python-psutil vte3)
makedepends=(git python-setuptools)
_commit=752b87dfb289f48c493fac4d2145e747f1809638
source=("git+https://github.com/flozz/nautilus-terminal#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $pkgname
  python3 setup.py build
}

package() {
  cd $pkgname
  python3 setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir"/usr/share/glib-2.0/schemas/gschemas.compiled
}
