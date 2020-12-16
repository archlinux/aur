# Maintainer: lightning1141 <lightning1141@gmail.com>

pkgname=qtalk-bin
pkgver=2.1.010
pkgrel=1
pkgdesc="QTalk (Window/Linux) 2.0 by Qunar"
arch=("x86_64")
url="https://qim.qunar.com"
license=('custom')
conflicts=('qtalk')
provides=('qtalk')
makedepends=('tar')
depends=('qt5-base' 'qt5-webengine' 'qt5-multimedia' 'qt5-x11extras' 'qt5-quickcontrols' 'qt5-svg')
source=("qtalk_linux_$pkgver.bin::https://qim.qunar.com/win_2_0/downloads/qtalk_setup_linux.run"
  "com.qunar.QTalk.desktop"
  "qunarim.png"
)
sha256sums=("26f4a5145e7d46e3dfff164655c2aab07f9375a5ecb2985786c9b1c3e4fb810c"
  "0b827bc0ee931fc3c53d2bcf36cfef656dfbadf3b731d61ef75db628d5b5b1de"
  "2334ea114a2949301d583051cdb64c5c8186aaa8fc9f402ecd04decbaf775128"
)

build() {
  msg "Extracting QTalk archive ..."
  tail +10 qtalk_linux_$pkgver.bin > QTalk.tar.bz2
  tar -jxvf QTalk.tar.bz2 -C "${srcdir}/"
  cp "com.qunar.QTalk.desktop" "${srcdir}/QTalk/com.qunar.QTalk.desktop"
  cp "qunarim.png" "${srcdir}/QTalk/qunarim.png"
}

package() {
  msg "Preparing icons ..."
  install -d "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/QTalk/com.qunar.QTalk.desktop" "${pkgdir}/usr/share/applications/"
  msg "Copying QTalk to /opt/qtalk..."
  install -d "${pkgdir}/opt/qtalk"
  cp -a ${srcdir}/QTalk/bin "${pkgdir}/opt/qtalk/bin"
  cp -a ${srcdir}/QTalk/res "${pkgdir}/opt/qtalk/res"
  cp -a ${srcdir}/QTalk/qunarim.png "${pkgdir}/opt/qtalk/qunarim.png"
  install -m755 "${srcdir}/QTalk/res/run.sh" "${pkgdir}/opt/qtalk/"
}
