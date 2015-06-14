# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=beamerscape-git
_pkgname=beamerscape
pkgver=0.5
pkgrel=2
pkgdesc="Tools for integrating Inkscape and LaTeX beamer"
arch=('any')
url="https://github.com/jbohren/beamerscape"
license=('BSD')
depends=('texlive-publishers' 'perl-xml-libxml' 'inkscape')
optdepends=('cmake>=2.8.3: to generate a large number of presentations')
provides=('beamerscape')
replaces=('beamerscape_hg')
conflicts=('beamerscape_hg')
_gitroot="https://github.com/jbohren/beamerscape.git"

build() {
  [ -d ${srcdir}/${pkgname} ] || mkdir -p ${srcdir}/${pkgname}
  cd ${srcdir}/${pkgname}
  git clone --depth 1 $_gitroot .
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
