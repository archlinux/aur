# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=qeven
pkgver=0.3.2
pkgrel=5
pkgdesc="Qt Easy Video Encoder (QEVEN) encodes media files to several video formats (VCD,DVD,SVCD,DIVX,XVID,FLV). Uses MEncoder and MPlayer."
arch=('i686' 'x86_64')
url="http://qeven.wordpress.com/"
license=('GPL3')
depends=('mencoder' 'mplayer' 'qt4')
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}_$pkgver.tar.bz2
        qeven.desktop)
sha256sums=('8c80b97e17f8eda60c0d5af71837dd6c9d9869dceace590b189a0030a8fc3366'
            'd6d670253e0f0b18738485edcf7f27faca7f65fb6300dc9475e8d8f2f1fe3e0f')

prepare() {
  cd ${pkgname}_$pkgver
  # Fix: update mencoder command line options
  sed -i "s/:cbp:/:o=mpv_flags=+cbp_rd:/" Core/video_item.cpp
}

build() {
  cd ${pkgname}_$pkgver
  qmake-qt4 QEVEN.pro
  make
}

package() {
  install -Dm644 qeven.desktop "$pkgdir/usr/share/applications/qeven.desktop"

  cd ${pkgname}_$pkgver

  install -Dm755 QEVEN "$pkgdir/usr/bin/qeven"

  install -Dm644 "Image/qeven(64x64).png" "$pkgdir/usr/share/pixmaps/qeven.png"

  install -dm755 "$pkgdir/usr/share/qeven/"{fonts,translation}
  install -m644 Fonts/* "$pkgdir/usr/share/qeven/fonts"
  install -m644 translation/*.qm "$pkgdir/usr/share/qeven/translation"
}

