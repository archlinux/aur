# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
_base=agena
pkgname=lib32-${_base}-bin
pkgver=3.7.6
pkgrel=1
pkgdesc="An Algol-inspired procedural programming language designed for science, scripting, and other applications"
arch=(x86_64)
url="http://${_base}.sourceforge.net"
license=(GPL)
depends=(lib32-libxext lib32-ncurses lib32-readline)
source=(${pkgname}-${pkgver}.deb::https://master.dl.sourceforge.net/project/${_base}/Binaries/Agena%20${pkgver}/${_base}-${pkgver}a-linux.i386.deb
  ${_base}.desktop)
sha512sums=('89f7cd5b9bfd7910015bdbd9127a9f53d91ac7f9958567c7296b696be89c15d33d64761f813f893dcf4de3b2f44f19b44ea42c2bb8cba7a60030847186c24dc5'
  'd09d4061c090039c06aa025543620da36a31a14a121cf3c73fd03e15583042577a63bc7555b27f572f22b409691c38a64969d66b655d42c773f0048b2d824c70')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  install -Dm 755 usr/local/bin/agena{,edit} -t "${pkgdir}/usr/bin/"
  install -Dm 644 usr/local/lib/libagena.so -t "${pkgdir}/usr/lib32/"
  install -Dm 644 agena.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm 644 usr/agena/share/icons/agenasmall.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/agena.png"
  install -Dm 644 usr/agena/share/icons/agena.png -t "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
  install -Dm 644 usr/agena/share/icons/agena64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/agena.png"
  install -Dm 644 usr/agena/share/icons/agena128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/agena.png"

  ln -s /usr/lib32/libhistory.so.7 "${pkgdir}/usr/lib32/libhistory.so.7"
  ln -s /usr/lib32/libncursesw.so "${pkgdir}/usr/lib32/libncurses.so.5"
  ln -s /usr/lib32/libreadline.so.8 "${pkgdir}/usr/lib32/libreadline.so.6"
  ln -s /usr/lib32/libreadline.so.8 "${pkgdir}/usr/lib32/libreadline.so.7"
  ln -s /usr/lib32/libncursesw.so "${pkgdir}/usr/lib32/libtinfo.so.5"
}
