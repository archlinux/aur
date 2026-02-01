# Contributor: Cullen Ross <cullenrss@gmail.com>

_pkgname='autoadb'
pkgname="${_pkgname}-git"
pkgver=r4.7f84029
pkgrel=4
arch=('x86_64')
license=('Apache-2.0')
makedepends=('git' 'rust')
provides=('autoadb')
conflicts=('autoadb')
pkgdesc="Allows executing a command whenever a new device is connected to adb"
url="https://github.com/rom1v/${_pkgname}"
source=("git+https://github.com/rom1v/autoadb")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  cargo build --release
}

package() {
  cd ${_pkgname}
  install -D -m 755 "$srcdir/${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
