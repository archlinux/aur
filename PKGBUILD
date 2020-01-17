# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=paymo-widget
pkgver=6.7.3
pkgrel=1
pkgdesc="An app that allows you to track work time via a stopwatch or manually add bulk time for paymo"
arch=('x86_64')
url="https://www.paymoapp.com/download/"
license=(proprietary)
depends=()
makedepends=()
optdepends=()
source=("paymo-widget-${pkgver}-x86_64.AppImage::https://www.paymoapp.com/widget?os=linux")
sha512sums=('ee9a8308b9f7c1191219477eea771add679d5d8789f16ac1ab8c95cd314be2d8cf960484ac3c29b45da3a1d14e10f30febd448e9fc08513fbdf3176f10da73b7')

prepare() {
  chmod +x "$srcdir"/paymo-widget-${pkgver}-x86_64.AppImage
}

package() {
  "$srcdir"/paymo-widget-${pkgver}-x86_64.AppImage --appimage-extract

  cd squashfs-root
  mkdir -p "$pkgdir"/opt/$pkgname
  mkdir -p "$pkgdir"/usr/bin
  cp -r usr/share "$pkgdir"/usr/share
  cp -r *.so paymo-widget resources locales *.dat *.bin *.pak "$pkgdir"/opt/$pkgname
  install -Dm644 paymo-widget.desktop "$pkgdir"/usr/share/applications/$pkname.desktop
  ln -s /opt/$pkgname/paymo-widget "$pkgdir"/usr/bin/$pkgname

  find "$pkgdir"/usr/share -type d -exec chmod 755 {} \;
  find "$pkgdir"/opt -type d -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
