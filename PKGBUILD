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
  "70be9a88177c1b39b0ebc4f1fe0a1d4d913089df211ebf54836d4769b14fa92f"
)
provides=("superdrive-enabler")

pkgver() {
  cd "${_pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  gcc $CPPFLAGS $CFLAGS $LDFLAGS -o "${_pkgname}" src/superdriveEnabler.c
}

package() {
  install -D 50-apple-superdrive.rules -t "$pkgdir/usr/lib/udev/rules.d/"

  cd "${_pkgname}"
  install -D -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
