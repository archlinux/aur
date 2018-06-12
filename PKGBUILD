# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=redshift-minimal-git
pkgver=1.12.r1.g01139a1
pkgrel=1
pkgdesc='Adjusts the color temperature of your screen according to your surroundings, with minimal dependencies (development version)'
arch=('i686' 'x86_64')
url='http://jonls.dk/redshift/'
license=('GPL3')
depends=('libxxf86vm')
makedepends=('git' 'intltool')
provides=('redshift')
conflicts=('redshift')
source=(redshift::"git+https://github.com/jonls/redshift.git")
sha256sums=('SKIP')

pkgver() {
  cd redshift
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd redshift

  ./bootstrap
  ./configure \
      --prefix=/usr \
      --disable-drm \
      --disable-geoclue \
      --disable-geoclue2 \
      --disable-gui \
      --disable-ubuntu \
      --disable-vidmode \
      --with-systemduserunitdir=/usr/lib/systemd/user \

  make
}

package() {
  make -C redshift DESTDIR="$pkgdir" install
  rm "${pkgdir}/usr/lib/systemd/user/redshift-gtk.service"
}
