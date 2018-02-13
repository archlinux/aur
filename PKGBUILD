# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-headless
_pkgname=libva
pkgver=2.1.0
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
sha256sums=('f3fa953a11d3210c3a4ee79031abdbe0863d5ce13d9b3f93f315f1eec60a4b0f')

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
