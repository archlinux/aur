# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-headless
_pkgname=libva
pkgver=1.8.2
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux headless systems'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://01.org/linuxmedia/vaapi'
license=('MIT')
conflicts=('libva')
provides=('libva')
depends=('libdrm')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards')
source=(https://github.com/01org/libva/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('9ed3e3ddc8f47a715d4c6ec366beb21c83fc4e8a3d4d39a811baff76f0a0cede')

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr --enable-drm --disable-x11 --disable-glx --disable-egl --disable-wayland
  make
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${_pkgname}/COPYING
}
