# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: onny <onny@project-insanity.org>

pkgname=sha3sum-git
pkgver=0.233.1.0.2.g297f992
pkgrel=2
pkgdesc="Checksum utility for Keccak and its close derivatives SHA-3, SHAKE and RawSHAKE"
url="https://github.com/maandree/sha3sum"
license=("AGPL3")
arch=('i686' 'x86_64')
makedepends=('auto-auto-complete' 'texman' 'texlive-plainextra')
depends=('argparser' 'libkeccak')
source=('git+https://github.com/maandree/sha3sum')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/sha3sum"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

build() {
  cd "${srcdir}/sha3sum"
  make default man
}

package () {
  cd "${srcdir}/sha3sum"
  make DESTDIR="${pkgdir}" install install-man

  cd "${pkgdir}/usr/share/licenses"
  mv sha3sum "${pkgname}"
}
