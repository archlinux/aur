# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=plata-theme-gs330
pkgver=0.6.0
pkgrel=1
pkgdesc='Plata theme that is not broken in GNOME Shell 3.30'
arch=('any')
url='https://gitlab.com/tista500/plata-theme/issues/33'
license=('CCPL' 'GPL2')
makedepends=('git' 'gnome-shell' 'inkscape' 'libxml2' 'parallel' 'sassc')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'ttf-roboto: Recommended font')
source=("git+https://gitlab.com/tista500/plata-theme.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd plata-theme

  ./autogen.sh \
    --prefix='/usr' \
    --enable-parallel \
    --enable-plank \
    --enable-telegram \
    --disable-cinnamon \
    --disable-flashback \
    --disable-xfce \
    --disable-mate

  make
}

package() {
  cd plata-theme

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/share/plank/themes
  ln -s /usr/share/themes/Plata/plank "${pkgdir}"/usr/share/plank/themes/Plata

  install -Dm 644 LICENSE_CC_BY_SA4 -t "${pkgdir}"/usr/share/licenses/plata-theme/
}
