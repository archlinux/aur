# Maintainer: surefire <surefire@cryptomile.net>
pkgname='cinnamon-applet-global-appmenu'
pkgver=0.6.git20160913.5b55d2d.fc28
pkgrel=1

pkgdesc='Cinnamon applet. Integrates the Ubuntu AppMenu (Global Menu) support into Cinnamon Desktop.'
arch=('any')
url='https://github.com/jake-phy/WindowIconList'
license=('GPL')

depends=('cinnamon' 'appmenu-gtk-module-git')
makedepends=('rpmextract')
provides=('cinnamon-applet-global-appmenu')
conflicts=('cinnamon-applet-global-appmenu')
replaces=('cinnamon-applet-global-appmenu-git')

source=(
  http://dl.fedoraproject.org/pub/fedora-secondary/releases/28/Everything/i386/os/Packages/c/cinnamon-applet-globalappmenu-0.6-4.git20160913.5b55d2d.fc28.noarch.rpm
  configurableMenus.patch
)
md5sums=(
  'edb90f3245d993a347f9206e362d6fc1'
  '3d7b129e6ee0aaabc772c4ff9479d726'
)

_appletname=globalAppMenu@lestcape

prepare() {
  rpmextract.sh cinnamon-applet-globalappmenu-0.6-4.git20160913.5b55d2d.fc28.noarch.rpm
  patch usr/share/cinnamon/applets/$_appletname/configurableMenus.js -i configurableMenus.patch
}

package() {
  install -d $pkgdir/usr
  cp -a usr $pkgdir
  rm -rf $pkgdir/usr/share/cinnamon/applets/$_appletname/po

  for mo in "usr/share/cinnamon/applets/$_appletname/po/mo/"*.mo; do
    local lang=$(basename "$mo" .mo)
    install -dm0755 "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES"
    install -m0644 "$mo" "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/${_appletname}.mo"
  done
}
