# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=paymo-widget
pkgver=6.6.13
pkgrel=1
pkgdesc="An app that allows you to track work time via a stopwatch or manually add bulk time for paymo"
arch=('x86_64')
url="https://www.paymoapp.com/download/"
license=(proprietary)
depends=()
makedepends=()
optdepends=()
source=("paymo-widget-${pkgver}-x86_64.AppImage::https://www.paymoapp.com/widget?os=linux")
sha512sums=('47d17cb6e4bfed255f52f2381ae5eb68f27ba0fd023ff1da92ff23d8619c2cc8996e7a09d4334d441c6915f715fd1996efeb4c4c6280bb4d550a66754ba99fd0')

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
