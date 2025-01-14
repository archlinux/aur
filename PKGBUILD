# $Id$
# Maintainer: MediaArea.net SARL <info@mediaarea.net>
# Maintainer: Stewart Webb <stew@rtwebb.com>

pkgname=mediaconch-gui
pkgver=24.06
pkgrel=1
pkgdesc="Implementation checker and policy checker for video and audio files (GUI)"
arch=('i686' 'x86_64')
url="http://mediaarea.net"
license=('GPL')
depends=('libxml2' 'libxslt' 'sqlite' 'jansson' 'libevent' 'qt5-base' 'libzen>=0.4.35')
makedepends=('desktop-file-utils' 'libxml2' 'libxslt' 'sqlite' 'qt5-base' 'libzen>=0.4.35' 'libmediainfo>=0.7.97')
source=(https://mediaarea.net/download/binary/mediaconch-gui/"$pkgver"/MediaConch_GUI_"$pkgver"_GNU_FromSource.tar.bz2)
sha256sums=('b284d8bfd52704bdf92fbc1b6f29e3185e25d216bc61dbc9444a60b61b2a4451')

prepare() {
  cd "${srcdir}"/MediaConch_GUI_GNU_FromSource/MediaConch/Project/Qt
  chmod u+x prepare
  ./prepare
}

build() {
  cd MediaConch_GUI_GNU_FromSource/MediaConch/Project/Qt
  make
}

package() {
  cd "${srcdir}"/MediaConch_GUI_GNU_FromSource/MediaConch
  install -D -m 0755 Project/Qt/mediaconch-gui "${pkgdir}"/usr/bin/mediaconch-gui

  install -D -m 0644 Source/Resource/Image/MediaConch.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/mediaconch.png
  
  install -D -m 0644 Source/Resource/Image/MediaConch.png "${pkgdir}"/usr/share/pixmaps/mediaconch.png
  
  desktop-file-install --dir="${pkgdir}"/usr/share/applications -m 0644 Project/GNU/GUI/mediaconch-gui.desktop
  
  install -D -m 0644 Project/GNU/GUI/mediaconch-gui.kde3.desktop "${pkgdir}"/usr/share/apps/konqueror/servicemenus/mediaconch-gui.desktop
  install -D -m 0644 Project/GNU/GUI/mediaconch-gui.kde4.desktop "${pkgdir}"/usr/share/kde4/services/ServiceMenus/mediaconch-gui.desktop
  install -D -m 0644 Project/GNU/GUI/mediaconch-gui.metainfo.xml "${pkgdir}"/usr/share/appdata/mediaconch-gui.metainfo.xml
  
  install -D -m 0644 License.html "${pkgdir}"/usr/share/licenses/"${pkgname}"/License.html
  install -D -m 0644 History_GUI.txt "${pkgdir}"/usr/share/docs/"${pkgname}"/History.txt
  
}

