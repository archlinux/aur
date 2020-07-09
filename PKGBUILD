# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=seq66
pkgname="${_pkgname}-git"
pkgver=0.90.3.r181.70e9302
pkgrel=1
pkgdesc="A live-looping sequencer with an Qt graphical interface (git version)"
arch=('i686' 'x86_64')
url="https://github.com/ahlstromcj/seq66"
license=('GPL2')
depends=('alsa-lib' 'jack' 'qt5-base')
makedepends=('git')
groups=('pro-audio')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/ahlstromcj/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=$(tail -n 1 VERSION)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./bootstrap
  ./configure --prefix=/usr --enable-rtmidi
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}/" install
}
