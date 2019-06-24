# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=redshift-wlr-gamma-control
pkgver=1.12+25+geecbfed
_commit=eecbfedac48f827e96ad5e151de8f41f6cd3af66
pkgrel=2
pkgdesc="Redshift fork supporting color temperature adjustment with wlroots"
arch=(i686 x86_64)
url=https://github.com/minus7/redshift/tree/wayland
license=(GPL3)
provides=(redshift)
conflicts=(redshift)
depends=(geoclue2 libdrm libxcb libxxf86vm)
optdepends=('python-gobject: for redshift-gtk'
            'python-xdg: for redshift-gtk'
            'gtk3: for redshift-gtk'
            'sway: Wayland environment with wlr-gamma-control protocol')
makedepends=(git intltool python wayland)
source=(git+${url/\/tree*/}#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd redshift
  git describe --long --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd redshift
  ./bootstrap
  ./configure \
    --prefix=/usr \
    --enable-drm \
    --enable-randr \
    --enable-vidmode \
    --enable-geoclue2 \
    --enable-wayland \
    --with-systemduserunitdir=/usr/lib/systemd/user
  make
}

package() {
  cd redshift
  make DESTDIR="$pkgdir" install
}
