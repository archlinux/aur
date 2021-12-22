# Maintainer: Omar Emara <mail@OmarEmara.dev>
pkgname=alsa-rnnoise
pkgver=1.0
pkgrel=1
pkgdesc="An ALSA plugin for noise removal based on RNNoise."
arch=('x86_64')
url="https://sr.ht/~arsen/alsa_rnnoise/"
license=('GPL3')
depends=('rnnoise' 'alsa-lib')
makedepends=('meson' 'ninja' 'git')
source=("${pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~arsen/alsa_rnnoise/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  meson \
    -Dprefix=/usr \
    -Dstatic_rnnoise=false \
    -Dconfig_dir=/etc/alsa/conf.d/ \
    build "alsa_rnnoise-v${pkgver}"
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
