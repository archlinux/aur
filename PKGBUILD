# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Wellington <wellingtonwallace@gmail.com>

pkgname=pulseeffects-legacy
pkgver=4.8.3
pkgrel=1
pkgdesc="Audio Effects for Pulseaudio Applications, without pipewire"
arch=($CARCH)
url='https://github.com/wwmm/pulseeffects'
license=(GPL3)
depends=(gtk3 gtkmm3 glibmm libpulse gstreamer gst-plugin-gtk gst-plugins-bad
         lilv boost-libs libsigc++ libsndfile libsamplerate zita-convolver libebur128
         calf lsp-plugins librnnoise)
makedepends=(meson boost itstool appstream-glib
             zam-plugins rubberband)
optdepends=('zam-plugins: maximizer'
            'rubberband: pitch shifting'
            'yelp: help documentation')
conflicts=(pulseeffects)
provides=(pulseeffects)
source=("${pkgname%-*}-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c1c1c82ec68baa0d4e44a49b494af1f9e3093f2e62590b3561bff5566048ba56')

build() {
  mkdir -p ${pkgname%-*}-$pkgver/build
  cd ${pkgname%-*}-$pkgver/build

  arch-meson ..

  ninja
}

package() {
  cd ${pkgname%-*}-$pkgver/build

  DESTDIR="$pkgdir" ninja install
}
