# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=libva-vdpau-driver
pkgver=0.7.4
pkgrel=2
pkgdesc="VDPAU backend for VA API"
arch=('i686' 'x86_64')
url="http://freedesktop.org/wiki/Software/vaapi"
license=('GPL')
depends=('libva' 'libvdpau' 'libgl')
makedepends=('mesa')
replaces=('vdpau-video')
source=(http://freedesktop.org/software/vaapi/releases/$pkgname/$pkgname-$pkgver.tar.bz2
        libva-vdpau-driver-0.7.4-glext-missing-definition.patch
        libva-vdpau-driver-0.7.4-libvdpau-0.8.patch
        libva-vdpau-driver-0.7.4-VAEncH264VUIBufferType.patch)
sha1sums=('224318f4ea8bafca6a0fec770e388b7d1a1a66b3'
          'e734b1e16211a78adc76c59279352dfeb8ea5b22'
          'f465fbf5dfc32459b060f320b9b2fe15a13e6d9d'
          '219a01631e2791fa3c3e077a9176c141aaf5f69b')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../libva-vdpau-driver-0.7.4-glext-missing-definition.patch
  patch -p1 -i ../libva-vdpau-driver-0.7.4-libvdpau-0.8.patch
  patch -p1 -i ../libva-vdpau-driver-0.7.4-VAEncH264VUIBufferType.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
