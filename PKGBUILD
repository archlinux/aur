# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='QRit'
pkgname="${_pkgname,,}-git"
pkgver=1.1.2.r0.gace3b28
pkgrel=1
pkgdesc='Create awesome QR codes'
arch=('x86_64')
url='https://github.com/sergius02/QRit'
license=('GPL3')
depends=('granite' 'qrencode')
makedepends=('git' 'meson' 'vala')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgname}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname,,}"
}

# vim: ts=2 sw=2 et:
