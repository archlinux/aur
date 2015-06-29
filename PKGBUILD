# Maintainer: Jesse Spangenberger <azulephoenix[at]gmail[dot]com>
# Contributor: Zom <zom[at]eevul[dot]org>

pkgbase=notepadqq
pkgname=('notepadqq-bin' 'notepadqq-common')
pkgver=0.50.1
_pkgver=0.50.1-0~vivid1
pkgrel=2
arch=('i686' 'x86_64')
url="http://notepadqq.altervista.org/wp/"
optdepends=('notepadqq-gtk: enables GTK style on startup')
makedepends=('pacman>=4.2.0')

source=("notepadqq-common.deb::http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq-common_${_pkgver}_all.deb")
source_i686=("notepadqq-bin_i686.deb::http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq_${_pkgver}_i386.deb")
source_x86_64=("notepadqq-bin_x86_64.deb::http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/notepadqq_${_pkgver}_amd64.deb")

noextract=("${source[@]%%::*}" "${source_i686[@]%%::*}" "${source_x86_64[@]%%:*}")

md5sums=('6d102412b327b90d70e23b3d551963c1')
md5sums_i686=('1b1b2efe79c7d3e0789d12e2b87aa21f')
md5sums_x86_64=('16a04cece23b9dd49746d62189daa97c')

package_notepadqq-bin() {
  pkgdesc="A Linux clone of Notepad++"
  depends=('qt5-webkit' 'desktop-file-utils')
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

