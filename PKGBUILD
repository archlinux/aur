# Maintainer: rnestler

_pkgname=reboot-arch-btw
pkgname=${_pkgname}-git
pkgver=0.5.4.r0.g1723727
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/${_pkgname}"
license=('GPL3')
makedepends=('git' 'rust' 'cargo')
depends=('dbus')
replaces=('kernel-updated')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/rnestler/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/${_pkgname} "${pkgdir}/usr/bin"
}
