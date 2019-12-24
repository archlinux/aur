# Maintainer: CubeTheThird <cubethethird@gmail.com>
# Contributor: Andrey Solomatin <toadron[at]yandex[dot]ru>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Geoffrey Teale <tealeg@stop-squark>
# Contributor: Mark, Huo Mian <markhuomian[at]gmail[dot]com>
# Contributor: Biginoz <biginoz a free dot fr>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname='redshift-gnomerr-git'
pkgver=1.11.r165.g1277e12
pkgrel=1
pkgdesc='Adjusts the color temperature of your screen according to your surroundings, with experimental Wayland support through gnomerr.'
arch=('i686' 'x86_64')
url='https://github.com/prahal/redshift/tree/add-gnomerr-method-v0.2'
license=('GPL3')
provides=('redshift')
conflicts=('redshift')
depends=('libxxf86vm' 'libdrm')
optdepends=('python: GTK support' 'gnome-desktop: Wayland support through Gnome RR')
makedepends=('git' 'intltool' 'python')
source=(redshift::"git+https://github.com/prahal/redshift.git#branch=add-gnomerr-method-v0.2")
md5sums=('SKIP')

pkgver() {
  cd redshift
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd redshift

  ./bootstrap
  ./configure --prefix=/usr --enable-randr --enable-drm --enable-vidmode --enable-geoclue2 \
    --with-systemduserunitdir=/usr/lib/systemd/user
  make
}

package() {
  cd redshift
  make DESTDIR="$pkgdir" install
}
