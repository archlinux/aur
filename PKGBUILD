# Maintainer: gabrielsimoes <simoes.sgabriel@gmail.com>

_pkgname="arc-firefox-theme"
pkgname="${_pkgname}-git"
pkgver=latest
pkgrel=3
pkgdesc="Arc Firefox Theme"
url="https://github.com/horst3180/arc-firefox-theme"
arch=('i686' 'x86_64')
license=('Mozilla Public License version 2.0')
depends=('firefox')
makedepends=('autoconf' 'automake' 'zip' 'unzip' 'git')
source=("${_pkgname}::git+https://github.com/horst3180/arc-firefox-theme.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}"/"${_pkgname}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/"${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${_pkgname}"/LICENSE
}
