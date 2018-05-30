# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=paymo-widget
pkgver=6.4.2
pkgrel=1
pkgdesc="An app that allows you to track work time via a stopwatch or manually add bulk time for paymo"
arch=('x86_64')
url="https://www.paymoapp.com/download/"
license=(proprietary)
depends=()
makedepends=()
optdepends=()
source=("paymo-widget-${pkgver}-x86_64.AppImage::https://www.paymoapp.com/widget?os=linux")
sha512sums=('1526a270aad64e42fd88fe049be25407be156af57f6555460fb23ba0a470e534ce29fba773bb9773a15fd0caeff2696cf6767f2a9794357669272efd32870999')

prepare() {
  chmod +x "$srcdir"/paymo-widget-${pkgver}-x86_64.AppImage
}

package() {
  "$srcdir"/paymo-widget-${pkgver}-x86_64.AppImage --appimage-extract

  cd squashfs-root
  rm -rf usr/lib
  mkdir -p "$pkgdir"/opt/$pkgname
  mkdir -p "$pkgdir"/usr/bin
  cp -r usr/share "$pkgdir"/usr/share
  cp -r app/* "$pkgdir"/opt/$pkgname
  install -Dm644 paymo-widget.desktop "$pkgdir"/usr/share/applications/$pkname.desktop
  ln -s /opt/$pkgname/paymo-widget "$pkgdir"/usr/bin/$pkgname

  find "$pkgdir"/usr/share -type d -exec chmod 755 {} \;
  find "$pkgdir"/opt -type d -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:

