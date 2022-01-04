# Maintainer: Vernes Siljegovic <vernes.siljegovic at gmail dot com>

pkgname=glocom
pkgver=6.4.1
pkgrel=1
pkgdesc="PBXware Global Communications Tool including Audio, IM, SMS, Fax and Meeting"
provides=('glocom')
conflicts=('glocom')
arch=('x86_64')
url="https://www.bicomsystems.com"
license=('custom')
depends=('libxss' 'libx11')
options=('!strip')
source=("https://downloads.bicomsystems.com/desktop/glocom/public/${pkgver}/glocom/gloCOM-${pkgver}.deb")
sha256sums=('b457737c0054adbd56c3e0a9dec08c2b686a6c68a3cd41c2c939e030913d09b6')
#install=$pkgname.install

package() {
  cd "$srcdir"

  tar -Jxf data.tar.xz -C "${pkgdir}"

  sed -i 's|#/bin/sh|#!/bin/sh|' "$pkgdir/opt/gloCOM/bin/glocom"

  install -dm755 "$pkgdir/usr/bin/"
  ln -s /opt/gloCOM/bin/glocom "$pkgdir/usr/bin/glocom"
  
  mkdir "$pkgdir/usr/share/.gloCOM"
  touch "$pkgdir/usr/share/.gloCOM/glocom.id"
  chmod 777 -R "$pkgdir/usr/share/.gloCOM"

  install -Dm644 ../gloCOM.desktop -t "$pkgdir/usr/share/applications/"

  install -Dm644 "$pkgdir/usr/share/gloCOM/logo.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/glocom.png"
}
