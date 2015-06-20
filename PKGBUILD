# Maintainer:  Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=lv2file
pkgname="${_pkgname}-git"
pkgver=0.84.r31.aed7c77
pkgrel=1
pkgdesc="A command line program to process audio files with LV2 plugins"
arch=('i686' 'x86_64')
url="https://github.com/jeremysalwen/lv2file"
license=('GPL3')
depends=('argtable')
makedepends=('git' 'lv2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/jeremysalwen/lv2file.git")
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
  install -Dm 644 debian/lv2file.1 "$pkgdir/usr/share/man/man1/lv2file.1"
}

# vim:set ts=2 sw=2 et:
