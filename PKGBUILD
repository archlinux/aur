# Maintainer: Oleh Sheremeta <me@olehsheremeta.com>
pkgname=simple-pomodoro
pkgver=1.3
pkgrel=1
pkgdesc="Simple to use Qt6 Pomodoro timer"
arch=('x86_64')
url="https://github.com/spikest3r/Pomodoro"
license=('GPL-3.0')

depends=('qt6-base')
makedepends=('qt6-base')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('53abbc8e95147011e65c690f179fe60c1f9efacfcc7e6f0f015d83e111c6bc43')

build() {
  cd "Pomodoro-$pkgver"
  /usr/lib/qt6/bin/qmake PREFIX=/usr CONFIG+=release
  make -j$(nproc)
}

package() {
  cd "Pomodoro-$pkgver"
  make INSTALL_ROOT="$pkgdir" install

  # Move binary to /usr/bin
  install -Dm755 "$pkgdir/opt/PomodoroTimer/bin/PomodoroTimer" \
                 "$pkgdir/usr/bin/simple-pomodoro"

  # Remove the /opt mess
  rm -rf "$pkgdir/opt"
}
