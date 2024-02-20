# Maintainer: Essem <smswessem@gmail.com>

pkgname=hivelytracker-git
pkgver=r119.f393ca7
pkgrel=1
pkgdesc='Chip music tracker based on AHX'
arch=('x86_64')
url='http://hivelytracker.co.uk/'
license=('BSD-3-Clause')
depends=(
  'sdl12-compat'
  'sdl_image'
  'sdl_ttf'
  'gtk3'
)
makedepends=('git')
source=("git+https://github.com/pete-gordon/hivelytracker.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}/sdl"
  make -f Makefile.linux
}

package() {
  cd "$srcdir/${pkgname%-git}/sdl"

  make -f Makefile.linux install PREFIX="$pkgdir/usr"
}
