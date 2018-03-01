# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=pulseeffects
pkgver=3.2.1
pkgrel=1
pkgdesc="Audio Effects for Pulseaudio Applications"
arch=(any)
url="https://github.com/wwmm/pulseeffects"
license=('GPL3')
depends=(python python-gobject python-cairo gtk3 gst-plugins-good gst-plugins-bad
         gst-python python-numpy python-scipy lilv)
optdepends=('swh-plugins: limiter, output limiter and compressor'
            'calf: exciter, bass enhancer and stereo enhancer'
            'zam-plugins-git: maximizer'
            'lsp-plugins-lv2-bin: delay'
            'rubberband: pitch shifting')
makedepends=('meson')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/wwmm/pulseeffects/archive/v$pkgver.tar.gz")
md5sums=('29f83973872343f284f82ff1085b8f96')

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
