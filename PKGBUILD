# Maintainer: Dave Daynard <nardholio at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on clearlooks-phenix-gtk-theme-git, also in the AUR

pkgname=clearlooks-phenix-gtk-theme
pkgver=7.1
pkgrel=1
pkgdesc="GTK3 theme visually close to Clearlooks"
arch=('any')
url="https://github.com/jpfleury/clearlooks-phenix"
license=('GPL3')
depends=('gtk-engines')
optdepends=('mist-icon-theme: a visually compatible icon theme'
            'gnome-themes-extra: provides theme fallbacks')
makedepends=('inkscape')
conflicts=('clearlooks-phenix-gtk-theme-git')
source=("https://github.com/jpfleury/clearlooks-phenix/archive/${pkgver}.tar.gz")
sha256sums=('8219c025341b2eaa992cba01e7ff6da3397e5a005fc4ae1038fdb371efcfb0ce')

build() {
  cd "clearlooks-phenix-${pkgver}"

  # Prefer building icons from SVG source
  export SELF_CALL=1
  make -C _src clean
  make -C _src
}

package() {
  cd "clearlooks-phenix-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/themes/Clearlooks-Phenix"
  cp -a gtk-2.0 gtk-3.0 index.theme metacity-1 openbox-3 wallpapers xfwm4 \
     "${pkgdir}/usr/share/themes/Clearlooks-Phenix"

  install -D -m 0644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/* *.md
}

# vim:set ts=2 sw=2 et:
