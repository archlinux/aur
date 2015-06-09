# Maintainer: CanalGuada <dguadal at free dot fr>
# Author: horst3180 @ deviantart

pkgname=vertex-themes
pkgver=20150425
pkgrel=1
pkgdesc='Vertex Gtk2, Gtk3, Metacity, Xfwm, Cinnamon and GNOME Shell themes (GNOME 3.16 version)'
_gnomever=3.16
_releasever=20150425
arch=('any')
url='http://horst3180.deviantart.com/art/Vertex-Theme-470663601'
license=('GPL3')
depends=('gtk-engine-murrine')
provides=('vertex-themes')
conflicts=('vertex-themes-git')
source=("${pkgname}-${_releasever}.tar.gz::https://github.com/horst3180/Vertex-theme/archive/${_releasever}.tar.gz")
sha256sums=('be5e78c83195aed3784f32eae3d588e1ca242158ad1165167ffd47f891745045')

build() {
  cd Vertex-theme-${_releasever}
  ./autogen.sh --prefix=/usr --with-gnome=${_gnomever}
}
package() {
  cd Vertex-theme-${_releasever}

  make DESTDIR="$pkgdir" install
  cd extra
  for name in "Chrome" "Firefox" "Vertex-Plank" "Vertex_alt_metacity"; do
    find "$name" -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
  done

  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 README.md "$pkgdir/usr/share/themes/Vertex/README"
}

# vim: ts=2 sw=2 et:
