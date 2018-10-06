# Maintainer: Andrey Solomatin <toadron[at]yandex[dot]ru>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Geoffrey Teale <tealeg@stop-squark>
# Contributor: Mark, Huo Mian <markhuomian[at]gmail[dot]com>
# Contributor: Biginoz <biginoz a free dot fr>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=redshift-wlr-gamma-control-git
pkgver=1.12.r44.ga2177ed
pkgrel=1
pkgdesc="Adjusts the color temperature of your screen according to your surroundings with Wayland wlr-gamma-control protocol support. (development version)"
arch=('i686' 'x86_64')
url='https://github.com/minus7/redshift/tree/wayland'
license=('GPL3')
provides=('redshift')
conflicts=('redshift')
depends=('geoclue2' 'libdrm' 'libxcb' 'libxxf86vm')
optdepends=('python-gobject: for redshift-gtk'
            'python-xdg: for redshift-gtk'
            'librsvg: for redshift-gtk'
            'sway-git: supporting wayland environment with wlr-gamma-control protocol')
makedepends=('intltool' 'python')
source=(redshift::"git+https://github.com/minus7/redshift.git#branch=wayland")
md5sums=('SKIP')

pkgver() {
  cd redshift
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd redshift

  ./bootstrap
  ./configure --prefix=/usr --enable-drm --enable-randr --enable-vidmode --enable-geoclue2 --enable-wayland \
    --with-systemduserunitdir=/usr/lib/systemd/user
  make
}

package() {
  cd redshift
  make DESTDIR="${pkgdir}" install
}
