# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=paymo-widget
pkgver=6.5.0
pkgrel=1
pkgdesc="An app that allows you to track work time via a stopwatch or manually add bulk time for paymo"
arch=('x86_64')
url="https://www.paymoapp.com/download/"
license=(proprietary)
depends=()
makedepends=()
optdepends=()
source=("paymo-widget-${pkgver}-x86_64.AppImage::https://www.paymoapp.com/widget?os=linux")
sha512sums=('7a0255c1c0bf4053a47fde44589fa3b9e098b4b25a3da09ff682ff023248f95a1c7b48f7658ba11403e46c553fd403b0139cc43852aa9ce6b776813b16cf68db')

prepare() {
  chmod +x "$srcdir"/paymo-widget-${pkgver}-x86_64.AppImage
}

package() {
  "$srcdir"/paymo-widget-${pkgver}-x86_64.AppImage --appimage-extract

  cd squashfs-root
  mkdir -p "$pkgdir"/opt/$pkgname
  mkdir -p "$pkgdir"/usr/bin
  cp -r usr/share "$pkgdir"/usr/share
  mv resources_1/* resources
  cp -r *.so paymo-widget resources locales *.dat *.bin *.pak "$pkgdir"/opt/$pkgname
  install -Dm644 paymo-widget.desktop "$pkgdir"/usr/share/applications/$pkname.desktop
  ln -s /opt/$pkgname/paymo-widget "$pkgdir"/usr/bin/$pkgname

  find "$pkgdir"/usr/share -type d -exec chmod 755 {} \;
  find "$pkgdir"/opt -type d -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:

