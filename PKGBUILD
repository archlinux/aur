# Maintainer: robertfoster
# Contributor: Bleuzen <supgesu@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Wellington <wellingtonwallace@gmail.com>

pkgname=easyeffects-git
pkgver=7.0.4.r111.g2916f27f
pkgrel=1
pkgdesc='Audio Effects for Pipewire applications'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='https://github.com/wwmm/easyeffects'
license=('GPL3')
depends=('fftw' 'libfmt.so' 'gsl' 'gtk4' 'libadwaita-1.so'
         'libbs2b.so' 'libebur128' 'libsamplerate.so'
         'libsigc-3.0.so' 'libsndfile.so' 'liblilv-0.so'
         'pipewire' 'rnnoise' 'librubberband.so'
         'speexdsp' 'tbb' 'zita-convolver')
makedepends=('appstream-glib' 'itstool' 'meson' 'nlohmann-json' 'speex' 'lv2')
optdepends=(
  'calf: limiter, exciter, bass enhancer and others'
  'lsp-plugins-lv2: equalizer, compressor, delay, loudness'
  'zam-plugins-lv2: maximizer'
  'mda.lv2: bass loudness plugin'
  'yelp: in-app help'
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
  arch-meson "${pkgname%%-git}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
