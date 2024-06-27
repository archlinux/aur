# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Davide Depau <davide@depau.eu>

_pkgname=mkbootimg
pkgname="${_pkgname}-git"
pkgver=2022.11.09.r1.g9d010816
pkgrel=1
pkgdesc="Android mkbootimg + unpackbootimg, forked and updated (osm0sis)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/osm0sis/mkbootimg"
license=('Apache-2.0')
license+=('BSD-3-Clause') # mincrypt license
source=("${_pkgname}::git+https://github.com/osm0sis/mkbootimg.git")
sha256sums=('SKIP')
provides=("${_pkgname}" unpackbootimg)
conflicts=("${_pkgname}" unpackbootimg)
makedepends=(git)

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"

  install -Dm755 mkbootimg "${pkgdir}/usr/bin/mkbootimg-osm0sis"
  install -Dm755 unpackbootimg "${pkgdir}/usr/bin/unpackbootimg"

  # Install the BSD license
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
