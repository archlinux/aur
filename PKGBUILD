# Maintainer: Sophie Tauchert <sophie@999eagle.moe>
# Based on upstream community package: https://github.com/archlinux/svntogit-community/blob/packages/pasystray/trunk/PKGBUILD

_pkgname=pasystray
pkgname=${_pkgname}-wayland
pkgver=0.8.1
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
sha512sums=('a9924b5b17833df4862f7c2bec5b518a3d8b6f2f80fe494c38a0cc07965095fb3155fc2181eb071f9acaf4629d81a908f2f622107c31346502293bfd4fa291a8')

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

