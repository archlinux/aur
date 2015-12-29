# Maintainer: Jesse Spangenberger <azulephoenix at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Zom <zom[at]eevul[dot]org> 

pkgbase=notepadqq
pkgname=('notepadqq-bin' 'notepadqq-common')
pkgver=0.50.6
_pkgver=0.50.6-0~wily1
pkgrel=1
arch=('i686' 'x86_64')
url="http://notepadqq.altervista.org/wp/"
optdepends=('notepadqq-gtk: enables GTK style on startup')
makedepends=('pacman>=4.2.0')

source=("notepadqq-common.deb::http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq-common_${_pkgver}_all.deb")
source_i686=("notepadqq-bin_i686.deb::http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq_${_pkgver}_i386.deb")
source_x86_64=("notepadqq-bin_x86_64.deb::http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq_${_pkgver}_amd64.deb")

noextract=("${source[@]%%::*}" "${source_i686[@]%%::*}" "${source_x86_64[@]%%:*}")

md5sums=('6eaaadd8d8058cddf69737cbfbca1b23')
md5sums_i686=('408a176a6adcd27a71ddaf9ffab361fc')
md5sums_x86_64=('5fb34f99f47334c66e49685e9b17e90c')

package_notepadqq-bin() {
  pkgdesc="A Linux clone of Notepad++"
  depends=('qt5-webkit>5.2' 'desktop-file-utils')
  depends_x86_64+=('gcc-libs-multilib')
  requires=('notepadqq-common=${pkgver}')
  conflicts=('notepadqq-git' 'notepadqq')
  provides=("notepadqq=${pkgver}")
  options=('!strip')
  license=('GPL3')
  install=${pkgname}.install
  
  cd "${srcdir}"
  bsdtar -xf ${pkgname}_${CARCH}.deb --include "data.tar.xz"
  bsdtar -xf data.tar.xz --exclude lintian -C "${pkgdir}"
  
}

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

