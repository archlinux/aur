# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=pulseeffects
pkgver=4.0.9
pkgrel=1
pkgdesc="Audio Effects for Pulseaudio Applications"
arch=(any)
url="https://github.com/wwmm/pulseeffects"
license=('GPL3')
depends=(gtk3 gtkmm3 glibmm libpulse gstreamer gst-plugins-good gst-plugins-bad
        lilv boost-libs libsigc++)
optdepends=('calf: limiter, compressor exciter, bass enhancer and others'
            'zam-plugins-git: maximizer'
            'lsp-plugins-lv2-bin: delay and expander'
            'rubberband: pitch shifting')
makedepends=('meson' 'boost')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wwmm/pulseeffects/archive/v$pkgver.tar.gz")
sha256sums=('f8323e4a96b3f7d0dcc8392f2a7563c817799b1db18e15b6b6635e03cb17ba67')

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
