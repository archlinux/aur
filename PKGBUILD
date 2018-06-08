# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=pulseeffects
pkgver=4.0.2
pkgrel=1
pkgdesc="Audio Effects for Pulseaudio Applications"
arch=(any)
url="https://github.com/wwmm/pulseeffects"
license=('GPL3')
depends=(gtk3 gtkmm3 glibmm libpulse gstreamer gst-plugins-good gst-plugins-bad
        lilv boost-libs libsigc++)
optdepends=('calf: limiter, compressor exciter, bass enhancer and others'
            'zam-plugins-git: maximizer'
            'lsp-plugins-lv2-bin: delay'
            'rubberband: pitch shifting')
makedepends=('meson' 'boost')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/wwmm/pulseeffects/archive/v$pkgver.tar.gz")
md5sums=('d6400c2055991276435d7497402c6e6a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Remove any potential residual build files
  rm -rf _build
  meson _build --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver/_build"
  env DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:
