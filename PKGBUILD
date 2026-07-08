# Maintainer:  kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Kujiu <kujiu+arch@kujiu.org>

pkgname=rolisteam
_pkgname=rolisteam
pkgver=1.10.0
pkgrel=1
pkgdesc="Virtual tabletop software. It helps you to manage tabletop role playing games with remote friends/players."
arch=('i686' 'x86_64' 'aarch64')
url="http://www.rolisteam.org"
license=(GPL)
depends=('qt5-svg' 'qt5-base' 'qt5-multimedia' 'zlib' 'qt5-webengine')
makedepends=('qt5-tools' 'git')
source=("https://invent.kde.org/rolisteam/rolisteam/-/archive/v${pkgver}/rolisteam-v${pkgver}.tar.gz"
        "rolisteam.desktop")
sha256sums=('b39015e8ac1d65bafa3ea7ced05eb0dcf3347ad30552a13a002f894567d6f2dd'
            'ec7a7cf3b02899f3a4f6af80010d369a54faf8b03c24726bebc370bc3d36e660')

build()
{
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git submodule update
  lrelease translations/*.ts
  qmake-qt5 "PREFIX=/usr/bin"
  make
}

package()
{
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/usr/share/icons/hicolor/256x256/apps
  install -Dm644 "rolisteam.desktop" "${pkgdir}/usr/share/applications/rolisteam.desktop"
  cd "${srcdir}/${_pkgname}"
  INSTALL_ROOT="${pkgdir}" make install
  cp resources/logo/256-icone.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/rolisteam.png
  chmod -R g-w "${pkgdir}"/usr
}


