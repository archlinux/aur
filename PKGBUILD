# $Id$
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Phillip Schichtel <phillip@schich.tel>

pkgname=adapta-gtk-theme-wal
pkgver=3.93.0.1
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines'
arch=('any')
url='https://github.com/adapta-project/adapta-gtk-theme'
license=('CCPL' 'GPL2')
makedepends=('git' 'gnome-shell' 'inkscape' 'libxml2' 'parallel' 'sassc')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'noto-fonts: Recommended font'
            'ttf-roboto: Recommended font')
source=(
  "git+https://github.com/adapta-project/adapta-gtk-theme.git#tag=${pkgver}"
  "colors.sh"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

provides=('adapta-gtk-theme')
conflicts=('adapta-gtk-theme')

build() {
  cd adapta-gtk-theme

  source "../colors.sh"

  ./autogen.sh \
    --prefix='/usr' \
    --enable-parallel \
    --enable-plank \
    --enable-telegram \
    --disable-unity \
    --enable-gtk_next \
    --with-selection_color="$color4" \
    --with-accent_color="$color6" \
    --with-suggestion_color="$color5" \
    --with-destruction_color="$color2"
  make
}

package() {
  cd adapta-gtk-theme

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/share/plank/themes
  ln -s /usr/share/themes/Adapta/plank "${pkgdir}"/usr/share/plank/themes/Adapta

  install -Dm 644 LICENSE_CC_BY_SA4 -t "${pkgdir}"/usr/share/licenses/adapta-gtk-theme/
}

# vim: ts=2 sw=2 et:
