pkgname=great-little-radio-player
pkgver=1.4.7
pkgrel=1
pkgdesc="A robust internet radio station streamer"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/glrpgreatlittleradioplayer"
license=('GPL3')
depends=('qt4' 'phonon' 'freetype2')
optdepends=('phonon-gstreamer')
source=(https://www.dropbox.com/s/3skkc58a9egi3bm/greatlittleradioplayer_1.4.7.tar.gz)
sha1sums=('2cf142b38130de51471cb451e9b88f14ce6ebb0f')

prepare() {
  cd greatlittleradioplayer_${pkgver}
  # Fix includes
  sed -i '/^#include/s|Phonon/|phonon/|' mainwindow.{h,cpp}
  sed -i '/^#include <phonon\/phonon>/d' mainwindow.cpp
}

build() {
  cd greatlittleradioplayer_${pkgver}
  qmake-qt4 PREFIX=/usr
  make
}

package() {
  cd greatlittleradioplayer_${pkgver}

  install -D GreatLittleRadioPlayer \
    "$pkgdir/opt/extras.ubuntu.com/glrp/GreatLittleRadioPlayer"

  cp -r changelog.txt glrp.svg stations.csv language styles \
    "$pkgdir/opt/extras.ubuntu.com/glrp/"

  install -Dm644 extras-greatlittleradioplayer.desktop \
    "$pkgdir/usr/share/applications/extras-greatlittleradioplayer.desktop"
}
