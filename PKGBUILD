# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libvdpau-git
pkgver=1.4
pkgrel=1
pkgdesc="Nvidia VDPAU library"
arch=(x86_64)
url='https://www.freedesktop.org/wiki/Software/VDPAU/'
depends=('libxext')
license=('custom')
source=("git+https://gitlab.freedesktop.org/vdpau/libvdpau.git")
makedepends=('xorgproto' 'git' 'meson')
provides=(libvdpau)
conflicts=(libvdpau)
sha256sums=('SKIP')

pkgver() {
  cd libvdpau
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson libvdpau build
  ninja $NINJAFLAGS -C build
}

#check() {
#  ninja $NINJAFLAGS -C build test
#}

package() {
  DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C build install
  install -Dm 644 $pkgname/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
