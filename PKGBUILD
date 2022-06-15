# Maintainer: Anders Pedersen <silwerspawn+aur.archlinux.org@gmail.com>
pkgname=edrawmax-bin
pkgver=11.5.6
pkgrel=2
pkgmaver=11
pkgmaname=EdrawMax
_pkgname_=edrawmax
epoch=
pkgdesc="All-in-One Diagram Software"
arch=('x86_64')
url="https://www.edrawsoft.com/edraw-max/"
license=("Copyright 2022 Edrawsoft. All rights reserved.")
groups=()
depends=('nss' 'alsa-lib' 'qt5-svg' 'gtk3' 'qt5-sensors' 'qt5-declarative' 'curl')
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
source=(http://download.edrawsoft.com/archives/${_pkgname_}_${pkgver}_en_${arch}.rpm edrawmax.desktop)
sha256sums=('2f58d4ee0705084255b18d8def6e609aa23cfcf9922632e38f13c17d790eb4f1'
'6ef72d55814737c3d49497857377ebadcf2f985da378605202e643e8cc450fc6')
noextract=()

package() {
  mkdir -p "${pkgdir}/opt/${pkgmaname}-${pkgmaver}"
  mv "${srcdir}/opt/EdrawMax-${pkgmaver}/"* "${pkgdir}/opt/${pkgmaname}-${pkgmaver}/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/mime/packages/"
  mkdir -p "${pkgdir}/usr/share/icons/gnome/scalable/mimetypes/"
  mkdir -p "${pkgdir}/usr/bin/"
  cd "${pkgdir}/opt/${pkgmaname}-${pkgmaver}"
  cp -f edrawmax.xml "${pkgdir}/usr/share/mime/packages/"
  cp -f eddx.svg "${pkgdir}/usr/share/icons/gnome/scalable/mimetypes/"
  cp -f edrawmax.desktop "${pkgdir}/usr/share/applications/"
  ln -f -s "/opt/${pkgmaname}-${pkgmaver}/${pkgmaname}" "${pkgdir}/usr/bin/edrawmax"
}

post_install() {
  chmod +x /opt/${pkgmaname}-${pkgmaver}/${pkgmaname}
  update-desktop-database /usr/share/applications
  update-mime-database /usr/share/mime
  gtk-update-icon-cache /usr/share/icons/gnome/ -f
  ldconfig
}

post_upgrade() {
  update-desktop-database /usr/share/applications
  update-mime-database /usr/share/mime
  gtk-update-icon-cache /usr/share/icons/gnome/ -f
  ldconfig
}

# vim:set ts=2 sw=2 et:
  
