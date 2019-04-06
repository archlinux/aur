# Maintainer: misson20000 <xenotoad@xenotoad.net>

pkgname=libtwili
pkgver=1.1.0.r0.g8cfcc8c
pkgrel=1
pkgdesc='Small twili IO library'
arch=('any')
url='https://github.com/misson20000/twili-libnx'
license=(ISC)
options=(!strip staticlibs)
depends=('libnx' 'devkit-env')
makedepends=("devkitpro-pkgbuild-helpers" "devkitA64" "switch-tools" "make" "git")
source=("git+https://github.com/misson20000/twili-libnx.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/twili-libnx"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/twili-libnx"

  make
}

package() {
  cd "$srcdir/twili-libnx"

  source /opt/devkitpro/devkita64.sh
  source /opt/devkitpro/switchvars.sh

  make DESTDIR="$pkgdir"${PORTLIBS_PREFIX} install
}
