# Maintainer: CanalGuada <dguadal at free dot fr>
# Author: horst3180 @ deviantart

pkgname=ceti-2-themes
pkgver=20150923
pkgrel=1
pkgdesc='Ceti-2 is a theme for GTK 3, GTK 2 and Gnome-Shell. It supports GTK 3 and GTK 2 based desktop environments like Gnome, Unity, Budgie, Pantheon, etc.'
_gnomever=3.16
_releasever=20150923
arch=('any')
url='http://horst3180.deviantart.com/art/Ceti-2-Theme-489193140'
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('ceti-2-themes-git')
source=("${pkgname}-${_releasever}.tar.gz::https://github.com/horst3180/Ceti-2-theme/archive/${_releasever}.tar.gz")
sha256sums=('a9978f52da7f66f30190183c5f24acb442ef699225e575ea7453682914901525')

build() {
  cd Ceti-2-theme-${_releasever}
  ./autogen.sh --prefix=/usr --with-gnome=${_gnomever}
}
package() {
  cd Ceti-2-theme-${_releasever}

  make DESTDIR="$pkgdir" install
  cd extra
  for name in "Chrome" "Ceti-2-alternative-metacity"; do
    find "$name" -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
  done

  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 README.md "$pkgdir/usr/share/themes/Ceti-2/README"
}

# vim: ts=2 sw=2 et:
