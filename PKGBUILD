# Maintainer: robertfoster
# Contributor: Bleuzen <supgesu@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Wellington <wellingtonwallace@gmail.com>

pkgname=easyeffects-git
pkgver=8.0.0.r0.g2a3986ca4
pkgrel=1
pkgdesc='Audio Effects for PipeWire applications'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='https://github.com/wwmm/easyeffects'
license=('GPL-3.0-only')
depends=(
  'breeze-icons'
  'gsl'
  'kconfigwidgets'
  'kiconthemes'
  'kirigami'
  'kirigami-addons'
  'libbs2b'
  'libebur128'
  'libportal-qt6'
  'libsamplerate'
  'libsndfile'
  'lilv'
  'nlohmann-json'
  'pipewire-pulse'
  'qqc2-desktop-style'
  'qt6-base'
  'qt6-graphs'
  'qt6-webengine'
  'rnnoise'
  'soundtouch'
  'speexdsp'
  'tbb'
  'webrtc-audio-processing'
  'zita-convolver'
)
makedepends=('appstream' 'cmake' 'extra-cmake-modules' 'git' 'intltool' 'ladspa' 'ninja')
optdepends=(
  'breeze: KDE breeze style'
  'calf: limiter, exciter, bass enhancer and others'
  'lsp-plugins: equalizer, compressor, delay, loudness'
  'zam-plugins: maximizer'
  'mda.lv2: bass loudness'
  'libdeep_filter_ladspa: noise remover'
)
conflicts=("${pkgname%%-git}")
provides=("${pkgname%%-git}")
source=("${pkgname%%-git}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%%-git}"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  local cmake_options=(
    -B build
    -S "${pkgname%%-git}"
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -G Ninja
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
