# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Madotsuki <madotsuki at cock dot li>

_pkgname=utox
pkgname=utox-git
pkgver=0.3.2.r41.gd16f539
pkgrel=2
pkgdesc='Lightweight Tox client'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/notsecure/uTox'
license=('GPL3')
depends=('desktop-file-utils'
         'fontconfig'
         'libfilteraudio-git'
         'hicolor-icon-theme'
         'libdbus'
         'libxext'
         'libxrender'
         'openal'
         'toxcore'
         'v4l-utils')
makedepends=('git')
optdepends=('gtk2: GTK file picker')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/notsecure/uTox")
md5sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
