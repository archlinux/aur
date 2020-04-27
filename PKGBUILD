_pkgname=kn0ck0ut-lv2
pkgname="${_pkgname}-git"
pkgver=r78.cbc4193
pkgrel=1
pkgdesc="An LV2 plugin to perform spectral subtraction"
arch=('i686' 'x86_64')
url="https://github.com/jeremysalwen/kn0ck0ut-LV2"
license=('GPL2')
depends=('fftw')
provides=('kn0ck0ut.lv2' "${_pkgname}" 'lv2-kn0ck0ut-git')
conflicts=('kn0ck0ut.lv2' "${_pkgname}" 'lv2-kn0ck0ut' 'lv2-kn0ck0ut-git')
groups=('lv2-plugins')
makedepends=('git' 'lv2' 'lv2-c++-tools')
source=("git+https://github.com/jeremysalwen/kn0ck0ut-lv2")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Seems like a debian-specific name for pkg-config
  sed -e 's/lv2core/lv2/g' -i Makefile

  CXXFLAGS+=" -I/usr/include/lv2-c++-tools "
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
