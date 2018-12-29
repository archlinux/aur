# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>
# Based on the work of the official adapta-gtk-theme package
# brought to you by these fine folks:
# $Id$
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Phillip Schichtel <phillip@schich.tel>

pkgname=adapta-gtk-theme-wal
pkgver=3.95.0.11
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
sha256sums=('SKIP'
            '830c99f4419532049a23f6e5499b249e1dc2cd132d8caacd2e41b4f60e3d79f7')

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
