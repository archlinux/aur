# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-headless
_pkgname=libva
pkgver=2.2.0
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
source=("https://github.com/intel/libva/releases/download/${pkgver}/libva-${pkgver}.tar.bz2")
sha256sums=('6f6ca04c785544d30d315ef130a6aeb9435b75f934d7fbe0e4e9ba6084ce4ef2')

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr --enable-drm --disable-x11 --disable-glx --disable-wayland
  make
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${_pkgname}/COPYING
}
