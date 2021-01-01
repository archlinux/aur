# Maintainer: Phantasm <phantasm@centrum.cz>
# Contributor: whight

pkgname=plata-theme-slim
_reponame=plata-theme
pkgver=0.9.9
pkgrel=2
pkgdesc='A GTK theme based on Material Design Refresh, built with most options disabled.'
arch=('any')
url='https://gitlab.com/tista500/plata-theme'
license=('GPL2' 'CCPL')
makedepends=('git' 'inkscape' 'libxml2' 'parallel' 'sassc')
optdepends=('gtk-engine-murrine: For GTK2 theming'
            'ttf-roboto: Recommended font')
provides=('plata-theme')
conflicts=('plata-theme')
source=("git+https://gitlab.com/tista500/plata-theme.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$_reponame"

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
  cd "$_reponame"

  make DESTDIR="$pkgdir" install

  install -Dm 644 LICENSE_CC_BY_SA4 -t "$pkgdir"/usr/share/licenses/"$pkgname"/
}
