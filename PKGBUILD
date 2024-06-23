# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=tuner
pkgver=1.5.2
pkgrel=1
pkgdesc="GNU/Linux app to discover and play internet radio stations. Geared towards RadioBrowser"
arch=('x86_64' 'i686')
url="https://codeberg.org/$pkgname/$pkgname"
license=('GPL-3.0-only')
depends=('granite' 'gst-plugins-bad-libs' 'gst-plugins-good')
optdepends=('gst-libav: play AAC[+] streams')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/louis77/$pkgname/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('68c57e2aaf7ed98c1717e40fc98637ee5c1c0e5f279d1667c796dcaed6bedd45')

build() {
  arch-meson "${pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  cd "${pkgdir}"/usr/bin/
  ln -s com.github.louis77.tuner tuner
}
