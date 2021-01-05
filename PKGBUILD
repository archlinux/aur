# Maintainer: Matej Lach <matej.lach@gmail.com>
# Contributor: kitech1 <vatic@vivaldi.net>
pkgname=edrawmax
pkgver=10.0
pkgrel=1
pkgmaver=10
pkgmaname=EdrawMax
epoch=
pkgdesc="All-in-One Diagram Software"
arch=('x86_64')
url="https://www.edrawsoft.com/edraw-max/"
license=('custom:"Copyright 2020 Edrawsoft. All rights reserved."')
groups=()
depends=()
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
source=(http://download.edrawsoft.com/archives/${pkgname}_${pkgver}_${arch}.rpm edrawmax.desktop)
sha256sums=('3cab7df07280fe5f90339b5457bdcce18af4805b81dc48cc7466fa031e7f3518'
'b0369cd8b8e2d3826f3bdc3362d6c18b9fdcbfa064625d823bd424c0d83b6b1e')
noextract=()

package() {
  mkdir -p "${pkgdir}/opt/${pkgmaname}-${pkgmaver}"
  mv ${srcdir}/opt/EdrawMax-10/* "${pkgdir}/opt/${pkgmaname}-${pkgmaver}/"
  mkdir -p ${pkgdir}/usr/share/applications/
  mkdir -p ${pkgdir}/usr/share/mime/packages/
  mkdir -p ${pkgdir}/usr/share/icons/gnome/scalable/mimetypes/
  mkdir -p ${pkgdir}/usr/bin/
  cd "${pkgdir}/opt/${pkgmaname}-${pkgmaver}"
  cp -f edrawmax.png ${pkgdir}/usr/share/icons/
  cp -f edrawmax.xml ${pkgdir}/usr/share/mime/packages/
  cp -f eddx.svg ${pkgdir}/usr/share/icons/gnome/scalable/mimetypes/
  cp -f edrawmax.desktop ${pkgdir}/usr/share/applications/
  ln -f -s /opt/${pkgmaname}-${pkgmaver}/${pkgmaname} ${pkgdir}/usr/bin/edrawmax
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
