# Maintainer: Vahlblue <c@vahl.blue>
pkgname=('fast-wfc-git')
pkgver=r90.854230a
pkgrel=1
pkgdesc='An implementation of Wave Function Collapse in C++'
arch=('any')
url='https://github.com/math-fehr/fast-wfc'
license=('MIT')
makedepends=('gcc' 'make' 'cmake')
provides=('fast-wfc')
source=("git+https://github.com/math-fehr/fast-wfc")
sha512sums=('SKIP')

prepare() {
  cd fast-wfc
  cmake .
}

pkgver() {
  cd fast-wfc
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd fast-wfc
  make
}

package() {
  cd fast-wfc

  make DESTDIR=${pkgdir} install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
