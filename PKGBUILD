# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=pulseeffects
pkgver=2.3.5
pkgrel=1
pkgdesc="Limiter, compressor, reverberation, stereo equalizer and auto volume effects for Pulseaudio applications"
arch=(any)
url="https://github.com/wwmm/pulseeffects"
license=('GPL3')
depends=(python python-gobject python-cairo gtk3 gst-plugins-good gst-plugins-bad
         gst-python swh-plugins python-numpy python-scipy)
makedepends=('python-setuptools' 'meson')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/wwmm/pulseeffects/archive/v$pkgver.tar.gz")
md5sums=('5c636d00ed45554039e50aa78ed232e8')

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
