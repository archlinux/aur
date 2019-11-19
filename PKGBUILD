# Maintainer: rnestler

_pkgname=reboot-arch-btw
pkgname=${_pkgname}-git
pkgver=46
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64')
url="https://github.com/rnestler/${_pkgname}"
license=('GPL3')
makedepends=('git' 'rust' 'cargo')
depends=('dbus')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/rnestler/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
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
