# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: ShadowKyogre <shadowkyogre.public@gmail.com>

pkgname=compiz-boxmenu
pkgver=1.1.12
pkgrel=4
pkgdesc="A desktop menu for compiz, forked from compiz-deskmenu by crdlb. Introduces extensive icon support, pipeitems, recent documents list, and more"
arch=('i686' 'x86_64')
url="https://gitlab.com/compiz/${pkgname}"
license=('GPL')
depends=('dbus-glib' 'libwnck' 'pygtk' 'python2-lxml' 'python2-pyxdg')
makedepends=('intltool' 'pkgconfig' 'gettext')
provides=('compiz-boxmenu_no-dbus' 'compiz-deskmenu')
conflicts=('compiz-boxmenu_no-dbus')
install=$pkgname.install
source=("https://gitlab.com/compiz/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg "Starting make..."
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make "DESTDIR=$pkgdir" install || return 1
  install -m755 autoconfig-compiz.py "$pkgdir/usr/bin/compiz-boxmenu-autoconfig" || return 1
  chmod 0644 "$pkgdir/etc/xdg/compiz/boxmenu/menu.xml"
  chmod 0644 "$pkgdir/etc/xdg/compiz/boxmenu/precache.ini"
  chmod 0644 "$pkgdir/usr/share/dbus-1/services/org.compiz_fusion.boxmenu.service"
}

sha256sums=('2bd0bf877d34135288fb8a914004855ea09aaed4220cd787be4436f60312987d')
