# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-headless
_pkgname=libva
pkgver=1.7.2
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux for headless systems'
arch=('i686' 'x86_64')
url='http://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
conflicts=('libva')
provides=('libva')
depends=('libdrm')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards')
source=(http://freedesktop.org/software/vaapi/releases/${_pkgname}/${_pkgname}-$pkgver.tar.bz2)
md5sums=('77d30af5a4bfaec6dddc2bdcbbd92ef5')

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
