# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=litescope-git
pkgver=95
pkgrel=2
pkgdesc="A small footprint and configurable Logic Analyzer for LiteX"
arch=(any)
url="https://github.com/enjoy-digital/litescope"
license=('MIT')
groups=()
depends=('python' 'migen' 'litex')
provides=('litescope')
options=(!emptydirs)
install=
source=("git+https://github.com/enjoy-digital/litescope")
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

