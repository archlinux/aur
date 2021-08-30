# Maintainer: Shayne Hartford <shayneehartford@gmail.com>
pkgname=pulseeffects
pkgver=5.0.4
pkgrel=1
pkgdesc="Audio Effects for Pipewire Applications"
arch=(any)
url="https://github.com/wwmm/easyeffects/tree/b4649e32ce0203ded66c957a05eba9150bd9b945"
license=('GPL3')
depends=(gtk3 gtkmm3 glibmm libpulse gstreamer gst-plugins-good gst-plugins-bad
        lilv boost-libs libsigc++ libsndfile libsamplerate zita-convolver
        libebur128)
optdepends=('calf: limiter, compressor exciter, bass enhancer and others'
            'zam-plugins: maximizer'
            'rubberband: pitch shifting'
            'mda.lv2: loudness')
makedepends=('meson' 'boost' 'itstool')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wwmm/easyeffects/archive/v$pkgver.tar.gz")
sha256sums=('8c8e2f4c41ca690305e7ea6132eef1d529d0463c4146dd3ffa16616ad7d53005')

build() {
  cd "$srcdir/easyeffects-$pkgver"
  # Remove any potential residual build files
  rm -rf _build
  meson _build --prefix=/usr --buildtype=release
}

package() {
  cd "$srcdir/easyeffects-$pkgver/_build"
  env DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:
