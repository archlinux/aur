# Maintainer: robertfoster
# Contributor: Bleuzen <supgesu@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Wellington <wellingtonwallace@gmail.com>

pkgname=easyeffects-git
pkgver=6.0.2.r0.g145d0ef9
pkgrel=1
pkgdesc='Audio Effects for Pipewire applications'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='https://github.com/wwmm/easyeffects'
license=('GPL3')
depends=('gtkmm-4.0' 'glibmm-2.68' 'pipewire' 'lilv' 'lv2' 'libsigc++-3.0' 'libsndfile' 'libsamplerate' 'zita-convolver' 
         'libebur128' 'rnnoise' 'rubberband' 'fftw' 'libbs2b' 'speexdsp' 'nlohmann-json')
makedepends=('appstream-glib' 'git' 'itstool' 'meson')
optdepends=('calf: limiter, exciter, bass enhancer and others'
            'lsp-plugins: equalizer, compressor, delay, loudness'
            'zam-plugins: maximizer'
            'mda.lv2: bass loudness'
            'yelp: in-app help')
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
