# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: AlphaJack <alphajack at tuta dot io>
_pkgname="xsnow"
pkgname=${_pkgname}-svn
pkgver=r434
pkgrel=2
pkgdesc="Let it snow on your desktop"
url="https://sourceforge.net/projects/xsnow/"
license=("GPL3")
arch=("x86_64" "i386" "armv7h" "aarch64")
conflicts=("xsnow" "xsnow-bin" "xsnow-legacy" "xsnow-comp-patch-git")
depends=("atk" "cairo" "gtk3" "gsl" "libx11" "libxpm" "libxml2")
makedepends=("subversion")
source=("svn+https://svn.code.sf.net/p/${_pkgname}/code/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/trunk"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build(){
 cd "trunk/${_pkgname}"
 ./configure
 make
}

package(){
 cd "trunk/${_pkgname}"
 install -D -m 755 "src/xsnow" "${pkgdir}/usr/bin/xsnow"
 install -D -m 644 "data/xsnow.appdata.xml" "${pkgdir}/usr/share/metainfo/xsnow.appdata.xml"
 install -D -m 644 "data/xsnow.desktop" "${pkgdir}/usr/share/applications/xsnow.desktop"
 install -D -m 644 "src/Pixmaps/xsnow.svg" "${pkgdir}/usr/share/pixmaps/xsnow.svg"
 install -d "${pkgdir}/usr/share/man/man6"
 gzip -c "src/xsnow.6" > "${pkgdir}/usr/share/man/man6/xsnow.6.gz"
}

