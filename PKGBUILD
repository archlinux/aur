# Contributor: abenson <adrian.m.benson@gmail.com>
# vim: ts=4 et sw=4 sts=4

pkgname=gmt-cpt-city
pkgver=2.15
_pkgsubver=1
pkgrel=1
pkgdesc="GMT color palettes (*.cpt) from the cpt-city collection"
arch=('any')
url="http://soliton.vm.bytemark.co.uk/pub/cpt-city"
license=('GPL' 'APACHE' 'CCPL' 'custom')
optdepends=('gmt: the Generic Mapping Tools')
source=(http://soliton.vm.bytemark.co.uk/pub/cpt-city/pkg/cpt-city_${pkgver}-${_pkgsubver}.tar.gz)
install=$pkgname.install
options=('!strip')   #nothing to strip, takes ages trying
md5sums=('778640246fe15dd68bc801f59c1f354b')

build() {
  cd "$srcdir"/cpt-city-${pkgver}
  ./configure --prefix="$pkgdir"/usr --mandir="$pkgdir"/usr/share/man
}

package() {
  cd "$srcdir"/cpt-city-${pkgver}
  make install 
  mkdir -p "$pkgdir"/usr/share/licenses
  mv "$pkgdir"/usr/share/doc/cpt-city/copying "$pkgdir"/usr/share/licenses/$pkgname
  rm -rf "$pkgdir"/usr/share/doc

  #create symlink in gmt dir
  mkdir -p "$pkgdir"/usr/share/gmt/cpt "$pkgdir"/opt/gmt5/share/cpt/cpt-city
  # link for use with GMT5
  # ln -s /usr/share/cpt-city "$pkgdir"/opt/gmt5/share/cpt/cpt-city
  # link for use with GMT4
  ln -s ../../cpt-city "$pkgdir"/usr/share/gmt/cpt/GMT_cpt-city
}
