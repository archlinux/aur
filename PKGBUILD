# Maintainer: Nathan Henrie <nate@n8henrie.com>
pkgname="superdrive-enabler-git"
_pkgname="superdrive-enabler"
pkgver=r9.809e81e
pkgrel=1
pkgdesc="Hack for Apple's Superdrive to work with other systems than OSX and MBA"
arch=("x86_64")
url="https://github.com/onmomo/superdrive-enabler"
license=("unknown")
makedepends=("git")
depends=("glibc")
source=(
  "${_pkgname}::git+https://github.com/onmomo/superdrive-enabler.git"
  "50-apple-superdrive.rules"
  )
sha256sums=(
  "SKIP"
  "5c0e6d95cc38c10111af59097a24dd36ee3789d0dceeef50355f3b293e129b95"
)
provides=("superdrive-enabler")

pkgver() {
  cd "${_pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  gcc -o "${_pkgname}" src/superdriveEnabler.c
}

package() {
  install -D 50-apple-superdrive.rules "$pkgdir/usr/lib/udev/rules.d/"

  cd "${_pkgname}"
  install -D -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
