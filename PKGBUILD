# Maintainer: Ridales

pkgname=plata-theme-slim
pkgver=0.9.7
pkgrel=2
pkgdesc='A Gtk theme based on Material Design Refresh, built with most options disabled.'
arch=('any')
url='https://gitlab.com/tista500/plata-theme'
license=('GPL2' 'CC BY-SA4')
makedepends=('git' 'inkscape' 'libxml2' 'parallel' 'sassc')
optdepends=('gtk-engine-murrine: for gtk2 theming'
            'ttf-roboto: Recommended font')
conflicts=('plata-theme')
source=("git+https://gitlab.com/tista500/plata-theme.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd plata-theme

  ./autogen.sh \
    --prefix='/usr' \
    --enable-parallel \
	--disable-gnome \
	--disable-cinnamon \
	--disable-flashback \
	--disable-xfce \
	--disable-mate
  make -j1 # Using GNU Parallel
}

package() {
  cd plata-theme

  make DESTDIR="$pkgdir" install

  install -Dm 644 LICENSE_CC_BY_SA4 -t "$pkgdir"/usr/share/licenses/plata-theme/
}
