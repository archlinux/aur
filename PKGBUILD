# $Id$
# Maintainer: MediaArea.net SARL <info@mediaarea.net>
# Maintainer: Stewart Webb <stew@rtwebb.com>

pkgname=mediaconch-gui
pkgver=17.05
pkgrel=1
pkgdesc="Implementation checker and policy checker for video and audio files (GUI)"
arch=('i686' 'x86_64')
url="http://mediaarea.net"
license=('GPL')
depends=('libxml2' 'libxslt' 'sqlite' 'jansson' 'libevent' 'qt5-base' 'qt5-webkit' 'libzen>=0.4.35')
makedepends=('desktop-file-utils' 'libxml2' 'libxslt' 'sqlite' 'qt5-base' 'qt5-webkit' 'libzen>=0.4.35' 'libmediainfo>=0.7.97')
source=(https://mediaarea.net/download/source/mediaconch/$pkgver/mediaconch_$pkgver.tar.bz2)
sha256sums=('4e36c4953ebae09b2b434a29f2496962c06e51295ce71f058964c60e6928ff39')

prepare() {
  cd "${srcdir}"/MediaConch/Project/Qt
  chmod u+x prepare
  ./prepare USE_WEBKIT=yes
}

build() {
  cd MediaConch/Project/Qt
  make
}

package() {
  cd "${srcdir}"/MediaConch
  install -D -m 0755 Project/Qt/mediaconch-gui "${pkgdir}"/usr/bin/mediaconch-gui

  install -D -m 0644 Source/Resource/Image/MediaConch.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/mediaconch.png
  
  install -D -m 0644 Source/Resource/Image/MediaConch.png "${pkgdir}"/usr/share/pixmaps/mediaconch.png
  
  desktop-file-install --dir="${pkgdir}"/usr/share/applications -m 0644 Project/GNU/GUI/mediaconch-gui.desktop
  
  install -D -m 0644 Project/GNU/GUI/mediaconch-gui.kde3.desktop "${pkgdir}"/usr/share/apps/konqueror/servicemenus/mediaconch-gui.desktop
  install -D -m 0644 Project/GNU/GUI/mediaconch-gui.kde4.desktop "${pkgdir}"/usr/share/kde4/services/ServiceMenus/mediaconch-gui.desktop
  install -D -m 0644 Project/GNU/GUI/mediaconch-gui.appdata.xml "${pkgdir}"/usr/share/appdata/mediaconch-gui.appdata.xml
  
  install -D -m 0644 License.html "${pkgdir}"/usr/share/licenses/${pkgname}/License.html
  install -D -m 0644 License.MPLv2.html "${pkgdir}"/usr/share/licenses/${pkgname}/License.MPLv2.html
  install -D -m 0644 License.GPLv3.html "${pkgdir}"/usr/share/licenses/${pkgname}/License.GPLv3.html
  
  install -D -m 0644 History_GUI.txt "${pkgdir}"/usr/share/docs/${pkgname}/History.txt
  
  install -D -m 0644 Release/ReadMe_GUI_Linux.txt "${pkgdir}"/usr/share/docs/${pkgname}/ReadMe.txt
}

