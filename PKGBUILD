# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=gtk-theme-equinox
pkgver=1.50
pkgrel=1
pkgdesc="Gtk theme for equinox engine"
url="http://gnome-look.org/content/show.php?content=140449"
license=('GPL2')
arch=('any')
depends=('gtk-engine-equinox')
optdepends=('faenza-icon-theme: icons designed for this theme')
source=("http://gnome-look.org/CONTENT/content-files/140449-equinox-themes-${pkgver}.tar.gz")
sha256sums=('32b3cedfbc27e466289aa8a0b6d1f3f964a553956d94bf267bd42c749691823c')
noextract=("140449-equinox-themes-${pkgver}.tar.gz")

package() {
  cd ${srcdir}
  mkdir -p "${pkgdir}/usr/share/themes"
  tar xzf 140449-equinox-themes-${pkgver}.tar.gz -C "${pkgdir}"/usr/share/themes

  mv "${pkgdir}/usr/share/themes/Equinox Evolution.crx" \
    "${pkgdir}/usr/share/themes/Equinox Evolution"

  for theme in Dawn Dusk Midnight; do
    mv "${pkgdir}/usr/share/themes/Equinox Evolution ${theme}.crx" \
      "${pkgdir}/usr/share/themes/Equinox Evolution ${theme}"
  done;

  cd "${pkgdir}/usr/share/themes/"
  find -type f -name "gtkrc" -exec sed -i 's/#include/include/g' {} \;

  chown -R root:root "${pkgdir}/usr/share/themes"
}
