# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='nmly'
pkgname="${_pkgname}-git"
pkgver=1.1.1.r1.ge147cbf
pkgrel=1
pkgdesc='Bulk rename utility with useful functions'
arch=('x86_64')
url='https://github.com/Usbac/nmly'
license=('MIT')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  # Add LDFLAGS to Makefile
  sed -i.bak '/\$(CFLAGS)/s/$/ \$(LDFLAGS)/' "${_pkgname}/Makefile"
}

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export LDFLAGS="${LDFLAGS}"
  make -C "${_pkgname}"
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
