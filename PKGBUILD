# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=pulseeffects
pkgver=4.1.9
pkgrel=1
pkgdesc="Audio Effects for Pulseaudio Applications"
arch=(any)
url="https://github.com/wwmm/pulseeffects"
license=('GPL3')
depends=(gtk3 gtkmm3 glibmm libpulse gstreamer gst-plugins-good gst-plugins-bad
        lilv boost-libs libsigc++ libsndfile libsamplerate zita-convolver)
optdepends=('calf: limiter, compressor exciter, bass enhancer and others'
            'zam-plugins: maximizer'
            'rubberband: pitch shifting'
            'mda.lv2: loudness')
makedepends=('meson' 'boost')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wwmm/pulseeffects/archive/v$pkgver.tar.gz")
sha256sums=('7c4dc3eb28ffbef3d7b1f176690a0e642e1a12da18745e9962ed69dd813e7f21')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Remove any potential residual build files
  rm -rf _build
  meson _build --prefix=/usr --buildtype=release
}

package() {
  cd "$srcdir/$pkgname-$pkgver/_build"
  env DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:
