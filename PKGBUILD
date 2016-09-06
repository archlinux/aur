# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=dockbarx
pkgname=${_pkgname}-gtk3-git
_branchname="pygi-migration"
_pkgver=0.92
pkgver=613.2c038b4
pkgrel=1
pkgdesc="DockBarX GTK3 port. (Currently only works as standalone dock - dockx)"
arch=('i686' 'x86_64')
url="https://github.com/M7S/dockbarx"
license=('GPL3')
depends=('libkeybinder3' 'python2-cairo' 'python2-dbus' 'python2-gobject' 'python2-pillow'
         'python2-xlib' 'python2-xdg' 'python2-xcffib')
optdepends=('zeitgeist: recently used file list'
            'compiz-fusion-plugins-main: opacify plugin'
            'dockmanager: dockmanager plugins'
            'cardapio-bzr: Menu applet for standalone dock - dockx')
makedepends=('git')
conflicts=('dockbarx' 'dockbarx-git' 'dockbarx-awn-applet-bzr')
provides=("${_pkgname}=${_pkgver}")
source=("${_pkgname}"::git+https://github.com/M7S/dockbarx.git#branch=${_branchname})

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd ${srcdir}/${_pkgname}

  python2 setup.py install --root ${pkgdir}

  #mkdir -p ${pkgdir}/usr/share/avant-window-navigator/applets
  #cp -r ${srcdir}/${_pkgname}/AWN/* ${pkgdir}/usr/share/avant-window-navigator/applets

  mkdir -p ${pkgdir}/usr/share/pixmaps
  install -Dm644 ${srcdir}/${_pkgname}/icons/hicolor/128x128/apps/dockbarx.png ${pkgdir}/usr/share/pixmaps/dockbarx.png

  mkdir -p "${pkgdir}"/usr/share/glib-2.0/schemas/
  install -m 644 "${srcdir}/${_pkgname}"/org.dockbar.dockbarx.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas/

  sed -i 's:^Categories=.*:Categories=GTK;GNOME;Settings;X-GNOME-PersonalSettings;:' ${pkgdir}/usr/share/applications/dbx_preference.desktop
}

sha256sums=('SKIP')
