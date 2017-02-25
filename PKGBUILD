# Maintainer: Kujiu <kujiu+arch@kujiu.org>

pkgname=rolisteam
_pkgname=rolisteam
pkgver=1.8.0
pkgrel=1
pkgdesc="Virtual tabletop software. It helps you to manage tabletop role playing games with remote friends/players."
arch=('i686' 'x86_64')
url="http://www.rolisteam.org"
license=(GPL)
depends=('qt5-base' 'zlib')
makedepends=('qt5-tools' 'gcc' 'git')
source=("git+https://github.com/Rolisteam/rolisteam.git#tag=v1.8.0")
sha256sums=('SKIP')

build()
{
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git submodule update
  lrelease translations/*.ts
  qmake-qt5
  make
}

package()
{
  cd "${srcdir}/${_pkgname}"
  INSTALL_ROOT="${pkgdir}" make install
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/256x256/apps
  cp resources/logo/256-icone.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/rolisteam.png
  DESKTOPFILE="${pkgdir}"/usr/share/applications/"${_pkgname}".desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=Rolisteam" >> "${DESKTOPFILE}"
  echo "Comment=${pkgdesc}" >> "${DESKTOPFILE}"
  echo "Exec=${_pkgname}" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Icon="${pkgdir}"/usr/share/icons/hicolor/256x256/apps/rolisteam.png" >> "${DESKTOPFILE}"
  echo "Categories=Game;" >> "${DESKTOPFILE}"
}


