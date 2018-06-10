# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=liteusb-git
pkgver=32
pkgrel=1
pkgdesc="A small footprint and configurable USB core"
arch=(any)
url="https://github.com/enjoy-digital/liteusb"
license=('MIT')
groups=()
depends=('python' 'migen' 'litex')
provides=('liteusb')
options=(!emptydirs)
install=
source=("git+https://github.com/enjoy-digital/liteusb")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git rev-list --count HEAD
}

prepare() {
  cd "${srcdir}/${pkgname%%-git}"
  rm -rf test/__init__.py
  rm -rf example_designs/__init__.py
}

build() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

