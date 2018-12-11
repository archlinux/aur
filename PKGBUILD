# Maintainer: whight

pkgname=plata-theme-slim
pkgver=0.4.7.1
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines, built with most options disabled.'
arch=('any')
url='https://gitlab.com/tista500/plata-theme'
license=('GPL2' 'CCbySA4')
depends=('gtk-engine-murrine' 'gtk3')
makedepends=('git' 'inkscape' 'libxml2' 'parallel' 'sassc')
provides=('plata-theme')
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
  make
}

package() {
  cd plata-theme

  make DESTDIR="${pkgdir}" install

  install -Dm 644 LICENSE_CC_BY_SA4 -t "${pkgdir}"/usr/share/licenses/plata-theme/
}
