# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: ShadowKyogre <shadowkyogre.public@gmail.com>

pkgname=compiz-boxmenu
pkgver=1.1.11
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
source=(http://master.dl.sourceforge.net/project/compizboxmenu/source%20snapshots/${pkgname}_-_${pkgver}.tar.gz)


build() {
  cd ${srcdir}/${pkgname}

  msg "Starting make..."
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=$pkgdir install || return 1
  install -m755 $srcdir/$pkgname/autoconfig-compiz.py $pkgdir/usr/bin/compiz-boxmenu-autoconfig || return 1
  chmod 0644 $pkgdir/etc/xdg/compiz/boxmenu/menu.xml
  chmod 0644 $pkgdir/etc/xdg/compiz/boxmenu/precache.ini
  chmod 0644 $pkgdir/usr/share/dbus-1/services/org.compiz_fusion.boxmenu.service
}

md5sums=('63496d47fc9ce55b9a7e14e442416aec')
