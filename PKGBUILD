# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Carl George < carl at george dot computer >

pkgname=pop-gtk-theme
pkgver=5.3.1
pkgrel=2
pkgdesc="System76 Pop GTK+ Theme"
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('LGPL2.1' 'CCPL' 'GPL3')
makedepends=('inkscape'
             'sassc'
             'optipng'
             'parallel'
             'meson'
             'glib2'
             'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pop-os/gtk-theme/archive/v${pkgver}.tar.gz")
sha256sums=('5e51f9b8d0e904d401a434cd0254766d2e461ff0e9d1f09e8b6a02fe030f4763')

build() {
  cd "gtk-theme-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "gtk-theme-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/share/gnome-shell/theme/Pop-dark "${pkgdir}/usr/share/themes/Pop-dark/gnome-shell"
}
# vim: ts=2 sw=2 et:
