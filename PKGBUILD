# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=pulseeffects
pkgver=3.1.5
pkgrel=1
pkgdesc="Audio Effects for Pulseaudio Applications"
arch=(any)
url="https://github.com/wwmm/pulseeffects"
license=('GPL3')
depends=(python python-gobject python-cairo gtk3 gst-plugins-good gst-plugins-bad
         gst-python python-numpy python-scipy lilv)
optdepends=('swh-plugins: limiter, output limiter and compressor plugins'
            'calf: exciter, bass enhancer and stereo enhancer plugins'
            'zam-plugins-git: maximizer plugin')
makedepends=('meson')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/wwmm/pulseeffects/archive/v$pkgver.tar.gz")
md5sums=('b93cf8e6182dd0d85f9f7415c3930818')

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
