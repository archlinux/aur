# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='reco'
pkgver=5.1.1
pkgrel=1
pkgdesc='An audio recording app designed for elementary OS'
arch=('x86_64')
url='https://github.com/ryonakano/reco'
license=('GPL-3.0-or-later')
depends=('gstreamer' 'libpulse' 'ryokucha' 'live-chart' 'libadwaita')
makedepends=('meson' 'vala' 'libhandy' 'blueprint-compiler')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2e9c8304e62297d172fe9f95e28dfe6606d37129e6bef371fcc89d5fbdf28499')

build() {
  arch-meson "${pkgname}-${pkgver}" build -Duse_submodule=false
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  ln -s /usr/bin/com.github.ryonakano.reco "${pkgdir}/usr/bin/reco"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}
