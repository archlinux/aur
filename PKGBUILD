# $Id: PKGBUILD 139371 2015-09-06 21:13:29Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrew Gregory <andrew.gregory.8@gmail.com>

pkgname=midori-gtk2
pkgver=0.5.11
pkgrel=6
pkgdesc='Lightweight web browser (GTK2)'
arch=('x86_64' 'i686')
url='http://www.midori-browser.org/'
license=('LGPL2.1')
conflicts=('midori')
provides=('midori')
depends=('webkitgtk2' 'libxss' 'gcr')
makedepends=('bzr' 'intltool' 'vala' 'cmake' 'ninja')
optdepends=('gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'gst-libav: HTML5 H264 videos support'
            'aria2: download utility')
options=('!emptydirs')
source=("http://www.midori-browser.org/downloads/${pkgname/-gtk2}_${pkgver}_all_.tar.bz2")
sha256sums=('96191a96be71144ae848a409fae5a1d6d52a00e583f33122081f47ead9c49c3d')

build() {
  cd "${pkgname/-gtk2}-$pkgver"

  mkdir -p build
  cd build
  cmake .. \
    -DUSE_ZEITGEIST=off \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C "${pkgname/-gtk2}-$pkgver/build" install
}

# getver: -u 2 midori-browser.org/download/source
# vim:set ts=2 sw=2 et:
