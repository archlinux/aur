# Maintainer: Nadia Holmquist Pedersen <nadia@nhp.sh>

pkgname=melonds-git-jit
pkgver=0.8.3.r1115.a9dd6e3
pkgdesc='DS emulator, sorta. also 1st quality melon - JIT recompiler branch.'
pkgrel=1
arch=('x86_64' 'aarch64')
url="http://melonds.kuribo64.net/"
license=('GPLv3')
makedepends=('git' 'cmake' 'make' 'pkg-config')
depends=('gtk3' 'sdl2')
optdepends=(
  "libpcap: for direct-mode wireless emulation"
)
provides=('melonds')
conflicts=('melonds' 'melonds-git')

_branch=generic_jit
source=("git+https://github.com/Arisotura/melonDS.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/melonDS"
  printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/melonDS"

  cmake -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "${srcdir}/melonDS"

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
