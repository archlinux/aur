# Maintainer: Jeremy MJ <jskier@gmail.com>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=xfce4-places-plugin
pkgver=1.8.1
pkgrel=1
pkgdesc="Places menu plugin for the Xfce panel"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-places-plugin"
license=('GPL2')
depends=('libnotify' 'xfce4-panel')
makedepends=('intltool')
source=("http://archive.xfce.org/src/panel-plugins/$pkgname/${pkgver%.*}/$pkgname-${pkgver}.tar.bz2"
        "mounts.patch")
sha256sums=('f211219f03c9260f624370e18c79e4176c9d35a8247158e77e5d811327610ab2'
            '0f772f067bff34dd94a473b192494335eb73c4c3d867e4f5bf81828f825d95eb')

prepare() {
  cd "$pkgname-$pkgver"

  # Show other mounts that are non disks (eg. NFS)
  patch -Np1 -i "${srcdir}/mounts.patch"
}

build() {
  cd "$pkgname-$pkgver"

  ./configure \
	--prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --disable-debug
  make
}
package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
