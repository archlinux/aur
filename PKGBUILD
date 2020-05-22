# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=indicator-sound
pkgver=12.10.2
pkgrel=1
pkgdesc='Unified sound menu indicator.'
arch=('i686' 'x86_64')
url="https://launchpad.net/${pkgname}"
license=('GPL')
depends=('ido' 'libdbusmenu-gtk3' 'libgee06' 'libindicator-gtk3' 'libpulse' 'libnotify')
makedepends=('intltool' 'vala')
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/indicator-sound/${pkgver}+16.04.20160406-0ubuntu1/indicator-sound_${pkgver}+16.04.20160406.orig.tar.gz")
sha256sums=('832d997edce41495638dd0234a4aed00bd6ccc9550ca3e1552ab909ba245e376')

build() {
  cd ${pkgname}-${pkgver}

  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  ./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --libexecdir="/usr/lib/${pkgname}" --disable-{schemas-compile,static}
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

# Fix icon names to provide the playlist icon
  install -dm 755 "${pkgdir}"/usr/share/libindicator/icons/hicolor/{16x16,scalable}/mimetypes
  mv "${pkgdir}"/usr/share/libindicator/icons/hicolor/16x16/{status/sound-icon.png,mimetypes/playlist.png}
  mv "${pkgdir}"/usr/share/libindicator/icons/hicolor/scalable/{status/sound-icon.svg,mimetypes/playlist.svg}
  rm -r "${pkgdir}"/usr/share/libindicator/icons/hicolor/{16x16,scalable}/status
}

# vim: ts=2 sw=2 et:
