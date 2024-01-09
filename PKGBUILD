# Maintainer: Anders Pedersen <silwerspawn+aur.archlinux.org@gmail.com>
pkgname=edrawmax-bin
pkgver=13.0.0
pkgrel=0
pkgmaver=13
pkgmaname=EdrawMax
_pkgmaname_=edrawmax
_pkgmaver_=5371
epoch=
pkgdesc="All-in-One Diagram Software"
arch=('x86_64')
url="https://www.edrawsoft.com/edraw-max/"
license=("Copyright 2022 Edrawsoft. All rights reserved.")
groups=()
depends=('nss' 'alsa-lib' 'qt5-svg' 'gtk3' 'qt5-declarative' 'curl')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=(https://download.edrawsoft.com/archives/${_pkgmaname_}_en_full${_pkgmaver_}.rpm edrawmax.desktop)
sha256sums=('a897f5a688686b644f258a5a11a324bece23aad6ef27839dba130665abc7c270'
'6ef72d55814737c3d49497857377ebadcf2f985da378605202e643e8cc450fc6')
noextract=()

package() {
  mkdir -p "${pkgdir}/opt/${_pkgmaname_}/${pkgmaver}"
  mkdir -p "${pkgdir}/usr/share"
  mv "${srcdir}/opt/EdrawMax-${pkgmaver}/"* "${pkgdir}/opt/${_pkgmaname_}/${pkgmaver}/"
  mv "${srcdir}/usr/share/"* "${pkgdir}/usr/share"
  mkdir -p "${pkgdir}/usr/bin/"
  sed -i "s#/opt/EdrawMax-#/opt/edrawmax/#" ${pkgdir}/opt/${_pkgmaname_}/${pkgmaver}/edrawmax.sh
  sed -i "s#/opt/EdrawMax-13#/opt/edrawmax/13#" ${pkgdir}/usr/share/applications/edrawmax.desktop
  chmod +x ${pkgdir}/opt/${_pkgmaname_}/${pkgmaver}/edrawmax.sh
  cd "${pkgdir}/opt/${_pkgmaname_}/${pkgmaver}"
  ln -f -s "/opt/${_pkgmaname_}/${pkgmaver}/${_pkgmaname_}.sh" "${pkgdir}/usr/bin/edrawmax"
}

post_install() {
  chmod +x /opt/${pkgmaname}-${pkgmaver}/${pkgmaname}
  update-desktop-database /usr/share/applications
  update-mime-database /usr/share/mime
  gtk-update-icon-cache /usr/share/icons/hicolor/ -f
  ldconfig
}

post_upgrade() {
  update-desktop-database /usr/share/applications
  update-mime-database /usr/share/mime
  gtk-update-icon-cache /usr/share/icons/hicolor/ -f
  ldconfig
}

# vim:set ts=2 sw=2 et:
  
