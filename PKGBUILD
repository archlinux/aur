# Maintainer: Janek Thomaschewski <janek@thomaschewski.dev>
# Contributor: Sophie Tauchert <sophie@999eagle.moe>
# Based on upstream community package: https://github.com/archlinux/svntogit-community/blob/packages/pasystray/trunk/PKGBUILD

_pkgname=pasystray
pkgname=${_pkgname}-wayland
pkgver=0.8.2
pkgrel=2
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
sha512sums=('a4c2c257678c161ed2daf53249bc4acf50002cd8485ce031fe98d20540ec684011651fc0e5e66cd925131629630371a834660b0da69c53dbd14521ed268d13ef')

build() {
  cd $_pkgname-$pkgver

  autoreconf -vif
  CFLAGS="--std=gnu18" ./configure \
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

