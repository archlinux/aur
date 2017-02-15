# Maintainer: Jesse Spangenberger <azulephoenix at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Zom <zom[at]eevul[dot]org> 

pkgbase=notepadqq
pkgname=('notepadqq-bin' 'notepadqq-common')
pkgver=1.0.1
_pkgver=1.0.1-0~yakkety1
pkgrel=2
arch=('i686' 'x86_64')
url="http://notepadqq.altervista.org/wp/"
optdepends=('notepadqq-gtk: enables GTK style on startup')
makedepends=('pacman>=4.2.0')

source=("notepadqq-common.deb::http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq-common_${_pkgver}_all.deb")
source_i686=("notepadqq-bin_i686.deb::http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq_${_pkgver}_i386.deb")
source_x86_64=("notepadqq-bin_x86_64.deb::http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq_${_pkgver}_amd64.deb")

noextract=("${source[@]%%::*}" "${source_i686[@]%%::*}" "${source_x86_64[@]%%:*}")

md5sums=('609439057e91e4a5b8e1d25fd8f2ac9f')
md5sums_i686=('357fa4007c7491f5297160de61ec4356')
md5sums_x86_64=('59069dd6112c01199691c07362136485')

package_notepadqq-common() {
  pkgdesc="A Linux clone of Notepad++ Common files"
  depends=('hicolor-icon-theme')
  license=('GPL3')
  options=('!strip' '!emptydirs')
  install=${pkgname}.install
  conflicts=('notepadqq-git')
  
  cd "${srcdir}"
  bsdtar -xf ${pkgname}.deb --include "data.tar.xz"
  bsdtar -xf data.tar.xz --exclude lintian -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/notepadqq.svg" "${pkgdir}/usr/share/pixmaps/notepadqq.svg"
}

package_notepadqq-bin() {
  pkgdesc="A Linux clone of Notepad++"
  depends=('qt5-webkit>5.2' 
	   'desktop-file-utils' 
	   'notepadqq-common='${pkgver})
  depends_x86_64+=('gcc-libs-multilib')
  conflicts=('notepadqq-git' 'notepadqq')
  provides=('notepadqq='${pkgver})
  options=('!strip')
  license=('GPL3')
  install=${pkgname}.install
  
  cd "${srcdir}"
  bsdtar -xf ${pkgname}_${CARCH}.deb --include "data.tar.xz"
  bsdtar -xf data.tar.xz --exclude lintian -C "${pkgdir}"
  
}


