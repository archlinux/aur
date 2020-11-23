# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=paymo-widget
pkgver=6.7.4
pkgrel=2
pkgdesc="An app that allows you to track work time via a stopwatch or manually add bulk time for paymo"
arch=('x86_64')
url="https://www.paymoapp.com/download/"
license=(proprietary)
source=("paymo-widget-${pkgver}-x86_64.AppImage::https://www.paymoapp.com/widget?os=linux")
sha512sums=('32a1abad843e774cdfaa97f312c7198f0aa2ef0e064c5f7071e1529519ce7f52a2e26555dbf53124dd6c4b58d07ff832a4b083cf8bde366d8a8c8753359a8030')

prepare() {
  chmod +x "$srcdir"/paymo-widget-${pkgver}-x86_64.AppImage
}

package() {
  "$srcdir"/paymo-widget-${pkgver}-x86_64.AppImage --appimage-extract

  cd squashfs-root
  mkdir -p "$pkgdir"/opt/$pkgname
  mkdir -p "$pkgdir"/usr/bin
  cp -r usr/share "$pkgdir"/usr/share
  cp -r *.so AppRun paymo-widget paymo-widget-noloader resources locales *.dat *.bin *.pak "$pkgdir"/opt/$pkgname
  install -Dm644 paymo-widget.desktop "$pkgdir"/usr/share/applications/$pkname.desktop
  ln -s /opt/$pkgname/AppRun "$pkgdir"/usr/bin/$pkgname

  find "$pkgdir"/usr/share -type d -exec chmod 755 {} \;
  find "$pkgdir"/opt -type d -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
