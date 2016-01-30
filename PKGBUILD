# $Id$
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Maintainer: Michael Novick <mnovick1988@gmail.com>

pkgname=libva-intel-driver_arm
_pkgname=libva-intel-driver
pkgbase=libva-intel-driver
pkgver=1.6.2
pkgrel=1
pkgdesc='VA-API implementation for Intel G45 and HD Graphics family. ARM Compliant.'
arch=('arm' 'armv6h' 'armv7h')
url='http://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
depends=('libva')
makedepends=('libdrm-git')
provides=('libva-driver-intel' 'libva-driver-intel_arm')
replaces=('libva-driver-intel' 'libva-driver-intel_arm')
source=(http://freedesktop.org/software/vaapi/releases/$_pkgname/$_pkgname-$pkgver.tar.bz2)
md5sums=('80ea2e1db7f90489d033f0dc32fbf4dd')

prepare() {
  cd $_pkgname-$pkgver

  # Only relevant if intel-gpu-tools is installed,
  # since then the shaders will be recompiled
  sed -i '1s/python$/&2/' src/shaders/gpp.py
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}
