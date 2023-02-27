# Maintainer: Yuriy Gabuev <yugabuev at gmail.com>

pkgname=river-shifttags-git
_pkgname=river-shifttags
pkgver=0.1.0.r0.g541bce8
pkgrel=1
pkgdesc="A small utility for the river Wayland compositor to rotate the focused tags"
arch=(x86_64)
url="https://gitlab.com/akumar-xyz/river-shifttags"
license=(GPL)
depends=(river)
makedepends=(git)
provides=('river-shifttags')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 -t "${pkgdir}/usr/bin" ./river-shifttags
  install -Dm 644 -t "${pkgdir}/usr/share/man/man1" ./river-shifttags.1
}
