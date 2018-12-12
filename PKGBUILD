# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-headless
_pkgname=libva
pkgver=2.3.0
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
sha256sums=('60840e50da6932ee2111e15fc8911180ff8a0d6f18bb9cc6ba8c1030098fdce4')

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
