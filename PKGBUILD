# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=lv2file
pkgname="${_pkgname}-git"
pkgver=0.84.r44.9c6fa09
pkgrel=1
pkgdesc="A command line program to process audio files with LV2 plugins"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/jeremysalwen/lv2file"
license=('GPL3')
depends=('argtable' 'libsndfile' 'lilv')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/jeremysalwen/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver=$(git describe --tags `git rev-list --tags --max-count=1` | cut -f 2 -d /)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make all
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="$pkgdir" install
  install -Dm 644 "debian/${_pkgname}.1" \
    "$pkgdir/usr/share/man/man1/${_pkgname}.1"
}

# vim:set ts=2 sw=2 et:
