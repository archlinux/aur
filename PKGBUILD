# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: ShadowKyogre <shadowkyogre.public@gmail.com>

pkgname=compiz-boxmenu
pkgver=1.1.12
pkgrel=1
pkgdesc="A desktop menu for compiz, forked from compiz-deskmenu by crdlb. Introduces extensive icon support, pipeitems, recent documents list, and more"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/compizboxmenu/"
license=('GPL')
depends=('dbus-glib' 'libwnck' 'pygtk' 'python2-lxml' 'pyxdg')
makedepends=('intltool' 'pkgconfig' 'gettext')
provides=('compiz-boxmenu_no-dbus' 'compiz-deskmenu')
conflicts=('compiz-boxmenu_no-dbus')
install=$pkgname.install
source=("compiz-boxmenu_-_${pkgver}.tar.gz::https://github.com/ShadowKyogre/Compiz-Boxmenu/archive/${pkgver}.tar.gz")


build() {
  cd "${srcdir}/Compiz-Boxmenu-${pkgver}"

  msg "Starting make..."
  make || return 1
}

package() {
  cd "${srcdir}/Compiz-Boxmenu-${pkgver}"
  make "DESTDIR=$pkgdir" install || return 1
  install -m755 autoconfig-compiz.py "$pkgdir/usr/bin/compiz-boxmenu-autoconfig" || return 1
  chmod 0644 "$pkgdir/etc/xdg/compiz/boxmenu/menu.xml"
  chmod 0644 "$pkgdir/etc/xdg/compiz/boxmenu/precache.ini"
  chmod 0644 "$pkgdir/usr/share/dbus-1/services/org.compiz_fusion.boxmenu.service"
}

md5sums=('d08f02dac27e9aef20a3a129fd327435')
