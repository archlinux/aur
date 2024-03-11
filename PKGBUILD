# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_pkgbase=vala-panel-extras
pkgbase=vala-panel-extras-git
pkgname=('vala-panel-extras-battery-git' 'vala-panel-extras-volume-git' 'vala-panel-extras-xkb-git' 'vala-panel-extras-gtop-git' 'vala-panel-extras-weather-git' 'vala-panel-extras-common-git' 'vala-panel-extras-xkb-flags-git')
pkgver=0.1.9.r47.ga1291fc
pkgrel=1
pkgdesc="Simple StatusNotifierItems for Indicator plugins"
url="https://gitlab.com/vala-panel-project/vala-panel-extras"
arch=('i686' 'x86_64')
license=('GPL3')
replaces=('vala-panel-extras-meta-git')
makedepends=('meson' 'vala' 'gtk3>=3.12.0' 'libxkbcommon-x11>=0.5.0' 'libxcb>=1.10' 'alsa-lib>=1.0.26' 'libcanberra' 'libgweather-4>=4.2.0' 'libx11' 'libgtop' 'git')
source=("git+https://gitlab.com/vala-panel-project/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  meson build "${srcdir}/${_pkgbase}" --prefix=/usr -Dauto_features=enabled
  meson compile -C build
}

package_vala-panel-extras-volume-git() {
  pkgdesc="Simple volume indicator"
  depends=('gtk3' 'alsa-lib>=1.0.26' 'libcanberra' 'vala-panel-extras-common-git')
            
  DESTDIR="${pkgdir}" meson install -C build
  rm -fr "$pkgdir/usr/share/vala-panel-extras/"
  rm -fr "$pkgdir/usr/share/locale/"
  rm -rf $pkgdir/usr/bin/vala-panel-extras-{xkb,gtop,weather,battery}
  rm -rf $pkgdir/usr/share/applications/org.valapanel.{xkb,gtop,weather,battery}.desktop
  rm -rf $pkgdir/usr/share/glib-2.0/schemas/org.valapanel.{xkb,gtop,weather,battery}.gschema.xml
}
package_vala-panel-extras-xkb-git() {
  pkgdesc="Simple keyboard layout indicator/switcher"
  depends=('gtk3' 'libxkbcommon-x11>=0.5' 'libxcb>=1.10' 'libx11' 'vala-panel-extras-common-git')

  DESTDIR="${pkgdir}" meson install -C build
  rm -fr "$pkgdir/usr/share/vala-panel-extras/"
  rm -fr "$pkgdir/usr/share/locale/"
  rm -rf $pkgdir/usr/bin/vala-panel-extras-{volume,gtop,weather,battery}
  rm -rf $pkgdir/usr/share/applications/org.valapanel.{volume,gtop,weather,battery}.desktop
  rm -rf $pkgdir/usr/share/glib-2.0/schemas/org.valapanel.{volume,gtop,weather,battery}.gschema.xml
}
package_vala-panel-extras-gtop-git() {
  pkgdesc="Simple network speed indicator"
  depends=('gtk3' 'libgtop' 'vala-panel-extras-common-git')

  DESTDIR="${pkgdir}" meson install -C build
  rm -fr "$pkgdir/usr/share/vala-panel-extras/"
  rm -fr "$pkgdir/usr/share/locale/"
  rm -rf $pkgdir/usr/bin/vala-panel-extras-{xkb,volume,weather,battery}
  rm -rf $pkgdir/usr/share/applications/org.valapanel.{xkb,volume,weather,battery}.desktop
  rm -rf $pkgdir/usr/share/glib-2.0/schemas/org.valapanel.{xkb,volume,weather,battery}.gschema.xml
}
package_vala-panel-extras-weather-git() {
  pkgdesc="Simple weather indicator"
  depends=('gtk3' 'libgweather-4>=4.2.0' 'vala-panel-extras-common-git')
  
  DESTDIR="${pkgdir}" meson install -C build
  rm -fr "$pkgdir/usr/share/vala-panel-extras/"
  rm -fr "$pkgdir/usr/share/locale/"
  rm -rf $pkgdir/usr/bin/vala-panel-extras-{xkb,gtop,volume,battery}
  rm -rf $pkgdir/usr/share/applications/org.valapanel.{xkb,gtop,volume,battery}.desktop
  rm -rf $pkgdir/usr/share/glib-2.0/schemas/org.valapanel.{xkb,gtop,volume,battery}.gschema.xml
}
package_vala-panel-extras-xkb-flags-git() {
  arch=('any')
  pkgdesc="Flags for XKB plugin"
  optdepends=('vala-panel-extras-xkb-git')
  
  DESTDIR="${pkgdir}" meson install -C build
  rm -fr "$pkgdir/usr/share/locale/"
  rm -fr "$pkgdir/usr/share/applications/"
  rm -fr "$pkgdir/usr/share/glib-2.0/"
  rm -fr "$pkgdir/usr/bin/"
  rm -fr "$pkgdir/usr/share/vala-panel-extras/doc"
}
package_vala-panel-extras-battery-git() {
  pkgdesc="Simple battery indicator"
  depends=('gtk3' 'upower>=0.99' 'vala-panel-extras-common-git')
  
  DESTDIR="${pkgdir}" meson install -C build
  rm -fr "$pkgdir/usr/share/vala-panel-extras/"
  rm -fr "$pkgdir/usr/share/locale/"
  rm -rf $pkgdir/usr/bin/vala-panel-extras-{xkb,gtop,weather,volume}
  rm -rf $pkgdir/usr/share/applications/org.valapanel.{xkb,gtop,weather,volume}.desktop
  rm -rf $pkgdir/usr/share/glib-2.0/schemas/org.valapanel.{xkb,gtop,weather,volume}.gschema.xml
}

package_vala-panel-extras-common-git() {
  arch=('any')
  pkgdesc="Common files for vala-panel-extras"
  replaces=('vala-panel-extras-translations-git')
  
  DESTDIR="${pkgdir}" meson install -C build
  rm -fr "$pkgdir/usr/share/vala-panel-extras/xkb"
  rm -fr "$pkgdir/usr/share/applications/"
  rm -fr "$pkgdir/usr/share/glib-2.0/"
  rm -fr "$pkgdir/usr/bin/"
}
