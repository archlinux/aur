# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='fltrdr'
pkgname="${_pkgname}-git"
pkgver=0.3.1.r0.gcee8f45
pkgrel=1
pkgdesc='TUI text reader for the terminal'
arch=('x86_64')
url='https://octobanana.com/software/fltrdr'
_url_source='https://github.com/octobanana/fltrdr'
license=('MIT')
depends=('icu' 'openssl')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${_url_source}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "build/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
