# Contributor: Christoph Gysin <christoph.gysin@gmail.com>
# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=pasystray-gtk2
_pkgname=pasystray
pkgver=0.7.1
pkgrel=2
pkgdesc="PulseAudio system tray (a replacement for padevchooser) (gtk2 version)"
arch=('x86_64' 'i686')
url="https://github.com/christophgysin/pasystray"
license=('LGPL')
depends=('libpulse' 'libnotify' 'libx11' 'gtk2')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
optdepends=(
    'pulseaudio: To control a local pulseaudio instance'
    'paman: Launch PulseAudio manager from tray icon'
    'pavucontrol: Launch PulseAudio mixer from tray icon'
    'pavumeter: Launch PulseAudio volume meter from tray icon'
    'paprefs: Launch PulseAudio preferences from tray icon'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('2988a27abbf42dca32e7a15b5f94d8f5d052662b455bf40971e736d6fbc9235d53bcd3c17ae3d12eac52c6241c4f11f4dee8667df8fb330ef39102d9d92f1837')

build() {
  cd $_pkgname-$pkgver

  autoreconf -vif
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-avahi \
    --disable-appindicator \
    --with-gtk=2
  make
}

package() {
  cd $_pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

