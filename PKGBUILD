# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=tnylpo-git
pkgver=r210.0eea604
_pkgname=tnylpo
pkgrel=1
pkgdesc="A utility to run programs written for CP/M-80."
arch=('x86_64' 'armv7h' 'armv6h' 'aarch64' 'i686' 'pentium4')
url="https://gitlab.com/gbrein/tnylpo"
license=('custom')
depends=()
makedepends=('git')
source=("${_pkgname}::git+https://gitlab.com/gbrein/tnylpo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  install -D -m 755 "tnylpo" "$pkgdir/usr/bin/tnylpo"
  install -D -m 755 "tnylpo-convert" "$pkgdir/usr/bin/tnylpo-convert"
  install -D -m 644 "tnylpo.1" "$pkgdir/usr/share/man/man1/tnylpo.1"
  install -D -m 644 "tnylpo-convert.1" "$pkgdir/usr/share/man/man1/tnylpo-convert.1"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

