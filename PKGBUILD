# Maintainer: Michał Lisowski <lisu at riseup dot net>
# Contributor: Adam Goldsmith <adam@adamgoldsmith.name>
# Contributor: Hong Xu <hong at topbug dot net>

pkgname=xfce4-i3-workspaces-plugin-git
pkgrel=1
pkgver=1.4.2.r5.gd7c2d97
pkgdesc="A workspace switcher plugin for xfce4-panel which can be used for the i3 window manager"
arch=('i686' 'x86_64')
url="https://github.com/denesb/xfce4-i3-workspaces-plugin"
source=("${pkgname}::git+https://github.com/denesb/xfce4-i3-workspaces-plugin")
md5sums=('SKIP')
license=('GPLv3')
depends=('xfce4-panel' 'i3ipc-glib-git')
makedepends=('git' 'autoconf' 'automake' 'intltool' 'xfce4-dev-tools')
provides=('xfce4-i3-workspaces-plugin')

build() {
  cd "${pkgname}"

  msg "Starting make..."
  ACLOCAL_PATH="/usr/share/gettext/m4:/usr/share/aclocal" ./autogen.sh --prefix=/usr
  make
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install

  msg "Including license..."
  install -v -D -m 644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
