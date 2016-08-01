# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=beamerscape-git
_pkgname=beamerscape
pkgver=r38.5d95cc1
pkgrel=1
pkgdesc="Tools for integrating Inkscape and LaTeX beamer"
arch=('any')
url="https://github.com/jbohren/beamerscape"
license=('BSD')
makedepends=('git')
depends=('texlive-publishers' 'perl-xml-libxml' 'inkscape')
optdepends=('cmake>=2.8.3: to \% Layergenerate a large number of presentations')
provides=('beamerscape')
replaces=('beamerscape_hg')
source=($pkgname::git+http://github.com/jbohren/beamerscape.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${pkgname}
  # as of 24/Sep/2015 a new escaping "%" is needed.
  sed -i 's#\\% Layer#%% Layer#g' bin/export_overlays
}

package() {

  cd ${srcdir}/${pkgname}
  [ -d ${pkgdir}/usr/bin ] ||  mkdir -p ${pkgdir}/usr/bin
  install -m755 bin/export_overlays ${pkgdir}/usr/bin

  [ -d ${pkgdir}/usr/share/apps/cmake/modules/ ] ||  mkdir -p ${pkgdir}/usr/share/apps/cmake/modules/
  install -m644 cmake/*.cmake ${pkgdir}/usr/share/apps/cmake/modules

  [ -d ${pkgdir}/usr/share/${_pkgname} ] ||  mkdir -p ${pkgdir}/usr/share/${_pkgname}
  cp -R examples ${pkgdir}/usr/share/${_pkgname}/

}
