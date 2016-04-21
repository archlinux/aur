# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Christian Hesse <mail at eworm dot de>
# Contributor: pmelo86 <patrick at patrickmelo dot eti dot br>

pkgname=lightdm-webkit-greeter-bzr
pkgver=r75
pkgrel=1
pkgdesc="A greeter for LightDM that uses Webkit for theming. (bzr version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/lightdm-webkit-greeter"
license=('GPL3' 'LGPL3')
depends=('lightdm' 'webkitgtk')
makedepends=('bzr' 'gnome-doc-utils' 'gobject-introspection' 'intltool')
provides=("lightdm-webkit-greeter")
conflicts=("lightdm-webkit-greeter")
source=("${pkgname%-*}::bzr+http://bazaar.launchpad.net/~lightdm-webkit-greeter-team/lightdm-webkit-greeter/trunk/")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${pkgname%-*}
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "${srcdir}"/${pkgname%-*}

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/lightdm
  make
}

package() {
  cd "${srcdir}"/${pkgname%-*}

  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/etc/lightdm
}
