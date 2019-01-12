_pkgname=rederr
pkgname="${_pkgname}"-git
pkgver=r5.4ef6ede
pkgrel=1
pkgdesc="Colour your stderr red"
arch=('x86_64')
url="https://github.com/poettering/rederr"
license=('LGPL2.1')
makedepends=('git' 'meson' 'ninja')
source=('git+https://github.com/poettering/rederr.git')
md5sums=('SKIP')

pkgver(){
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  meson --prefix=/usr build
  cd build
  ninja
}

package() {
  cd "$_pkgname"
  cd build
  DESTDIR="${pkgdir}/" PREFIX=/usr ninja install
}

# vim:set ts=2 sw=2 et:
