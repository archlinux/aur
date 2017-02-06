# Maintainer: Andrey Solomatin <toadron[at]yandex[dot]ru>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Geoffrey Teale <tealeg@stop-squark>
# Contributor: Mark, Huo Mian <markhuomian[at]gmail[dot]com>
# Contributor: Biginoz <biginoz a free dot fr>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=redshift-sway-git
pkgver=1.11.r26.g295c8fa
pkgrel=2
pkgdesc="Will be removed. Please update to redshift-wayland-git package."
arch=('i686' 'x86_64')
url='https://github.com/Lourens-Rich/redshift'
license=('GPL3')
provides=('redshift')
conflicts=('redshift')
depends=('geoclue2' 'libdrm' 'libxcb' 'libxxf86vm')
optdepends=('python-gobject: for redshift-gtk'
            'python-xdg: for redshift-gtk'
            'librsvg: for redshift-gtk'
	    'sway-git: supporting wayland environment')
makedepends=('intltool' 'python')
source=(redshift::"git+https://github.com/Lourens-Rich/redshift.git")
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
