# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=webrtc-audio-processing-1
pkgver=1.1+1+g92a4765
pkgrel=1
pkgdesc="AudioProcessing library based on Google's implementation of WebRTC"
url="https://freedesktop.org/software/pulseaudio/webrtc-audio-processing/"
arch=(x86_64)
license=(custom)
depends=(gcc-libs abseil-cpp)
makedepends=(git meson)
provides=(libwebrtc-audio-{coding,processing}-${pkgver%%.*}.so)
_commit=92a4765a7e02d9281328f6d0ec9334891962c230  # master
source=("git+https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd webrtc-audio-processing
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd webrtc-audio-processing
}

build() {
  arch-meson webrtc-audio-processing build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 webrtc-audio-processing/COPYING
}

# vim:set sw=2 et:
