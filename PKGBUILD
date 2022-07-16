# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=xfdashboard
pkgver=0.9.91
pkgrel=1
pkgdesc="Maybe a Gnome shell like dashboard for Xfce"
arch=('i686' 'x86_64' 'aarch64')
url="http://goodies.xfce.org/projects/applications/xfdashboard/start"
license=('GPL')
depends=('libwnck3' 'clutter' 'garcon')
makedepends=('xfce4-dev-tools')
source=("https://github.com/gmc-holle/xfdashboard/archive/${pkgver}.tar.gz")
sha256sums=('c101f67384f86f2676aef4f4c3d0ea4ee48082c54f95f21189334c44f84136ef')

build() {
  cd "${pkgname}-${pkgver}"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --disable-dependency-tracking
  # -Wl,--as-needed should come before all libraries
  sed -i -e '/\$CC/s/-shared/\0 -Wl,--as-needed/' libtool
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
