# Maintainer: robertfoster
# Contributor: Bleuzen <supgesu@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Wellington <wellingtonwallace@gmail.com>

pkgname=pulseeffects-git
pkgver=4.8.4.r75.g7130c640
pkgrel=1
pkgdesc='Audio Effects for Pulseaudio Applications'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='https://github.com/wwmm/pulseeffects'
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'glibmm' 'libpulse' 'gstreamer' 'gst-plugin-gtk' 'gst-plugins-bad' 'gst-plugin-pipewire'
  'lilv' 'boost-libs' 'libsigc++' 'librnnoise' 'libsndfile' 'libsamplerate' 'zita-convolver' 'libebur128'
  'calf' 'lsp-plugins' 'yelp')
makedepends=('meson' 'boost' 'git' 'itstool' 'appstream-glib'
  'zam-plugins' 'rubberband')
optdepends=('zam-plugins: maximizer'
  'rubberband: pitch shifting')
source=("git+https://github.com/wwmm/pulseeffects.git")
conflicts=(pulseeffects)
provides=(pulseeffects)
sha512sums=('SKIP')

pkgver() {
  cd pulseeffects
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p pulseeffects/build
  cd pulseeffects/build

  arch-meson ..

  ninja
}

package() {
  cd pulseeffects/build

  DESTDIR="$pkgdir" ninja install
}
