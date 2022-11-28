# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname=sonic
pkgname=libsonic-git
pkgver=0.2.0_53+r182.20180706.71c5119
pkgrel=1
pkgdesc="Simple library to speed up or slow down speech"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/waywardgeek/sonic"
license=('Apache')
depends=('gcc')
makedepends=('git' 'fftw')
provides=("libsonic=${pkgver}")
conflicts=('libsonic')
source=("git+https://github.com/waywardgeek/${_pkgname}.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe --tags | sed -E 's|[a-zA-Z]+\-||g' | sed -E 's|[\-]g[0-9a-fa-f]+||g' | sed 's|^v||' | tr '-' '_')"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  if [ -n "${_ver}" ]; then
    printf %s "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
  }

# vim:set ts=2 sw=2 et:
