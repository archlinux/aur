# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Madotsuki <madotsuki at cock dot li>

pkgname=utox
_pkgname=uTox
pkgver=0.12.1
pkgrel=1
pkgdesc='Lightweight Tox client'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/uTox/uTox"
license=('GPL3' 'MIT')
depends=('fontconfig'
         'libfilteraudio'
         'libxext'
         'libxrender'
         'openal'
         'toxcore'
         'v4l-utils')
optdepends=('gtk3: GTK file picker' 'libdbus: Notification support')
makedepends=('toxcore>=0.1.0')
source=("https://github.com/uTox/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('091b84768ea96eea7b12e0017c77f9015a7e3a105f5451f33f906af14b498de7')

build() {
  cd "$_pkgname-$pkgver"
  CFLAGS="-Wl,-z,noexecstack" cmake . -DCMAKE_BUILD_TYPE=Release -DENABLE_ASAN=OFF -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}
