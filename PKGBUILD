# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=libxcursor-git
pkgver=1.2.0
pkgrel=1
pkgdesc="X cursor management library"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libxfixes' 'libxrender')
optdepends=('gnome-themes-standard: fallback icon theme')
makedepends=('xorg-util-macros')
provides=(libxcursor)
conflicts=(libxcursor)
backup=(usr/share/icons/default/index.theme)
source=("git+https://gitlab.freedesktop.org/xorg/lib/libxcursor")
sha512sums=('SKIP')

pkgver() {
  cd libxcursor
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd libxcursor
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd libxcursor
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/icons/default"

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
