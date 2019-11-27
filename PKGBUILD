# Maintainer: Kujiu <kujiu+arch@kujiu.org>

pkgname=rolisteam
_pkgname=rolisteam
pkgver=1.9.1
pkgrel=2
pkgdesc="Virtual tabletop software. It helps you to manage tabletop role playing games with remote friends/players."
arch=('i686' 'x86_64')
url="http://www.rolisteam.org"
license=(GPL)
depends=('qt5-base' 'qt5-multimedia' 'zlib' 'qt5-webengine')
makedepends=('qt5-tools' 'gcc' 'git')
source=("git+https://github.com/Rolisteam/rolisteam.git#tag=v${pkgver}"
        "rolisteam.desktop")
sha256sums=('SKIP' 'ec7a7cf3b02899f3a4f6af80010d369a54faf8b03c24726bebc370bc3d36e660')

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


