# Maintainer: kj_sh604 <406hs_jk@proton.me>

pkgname=pavucontrol-gtk3
pkgver=5.0
pkgrel=1
epoch=1
pkgdesc="PulseAudio Volume Control 5.0 (last GTK3 release)"
url="https://freedesktop.org/software/pulseaudio/pavucontrol/"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  atkmm
  gcc-libs
  glib2
  glibc
  glibmm
  gtk3
  gtkmm3
  json-glib
  libcanberra
  libpulse
  libsigc++
)
makedepends=(
  git
  lynx
  meson
)
conflicts=('pavucontrol')
provides=('pavucontrol')
checkdepends=(tidy)
optdepends=("pulseaudio: Audio backend")
_commit=c330506815f78f77f6685cb40749679eae789d63  # master
source=("git+https://gitlab.freedesktop.org/pulseaudio/pavucontrol.git#commit=$_commit")
b2sums=('5601fbcb53a5545e86bc179c3e2c2b8d1c0ad1b31a3251e90011368151495668493a6737e359cc6d9c2c5e8d8c964f137a96af69f1b984f7a31318619532360c')

prepare() {
  cd pavucontrol
}

build() {
  arch-meson pavucontrol build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
