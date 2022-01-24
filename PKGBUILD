# Maintainer: Sophie Tauchert <sophie@999eagle.moe>
# Based on upstream community package: https://github.com/archlinux/svntogit-community/blob/packages/pasystray/trunk/PKGBUILD

_pkgname=pasystray
pkgname=${_pkgname}-wayland
pkgver=0.8.0
pkgrel=1
pkgdesc='PulseAudio system tray (a replacement for padevchooser) built for Wayland support'
arch=('x86_64')
provides=('pasystray')
conflicts=('pasystray')
url="https://github.com/christophgysin/pasystray"
license=('LGPL')
depends=('libpulse' 'libnotify' 'avahi' 'gtk3' 'libappindicator-gtk3')
optdepends=('pulseaudio: To control a local pulseaudio instance'
            'pavucontrol: Launch PulseAudio mixer from tray icon'
            'paprefs: Launch PulseAudio preferences from tray icon')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('104c68e41659306ca1e750d0d580d6ffcf4411da2da51a4f2780f551e12da9e104eb66ea841234292769f05a15f8f14ceaefc55893cf551a47124d086b1fb291')

build() {
  cd $_pkgname-$pkgver

  autoreconf -vif
  ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --disable-x11 \
        --enable-appindicator

  make
}

package() {
  cd $_pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

