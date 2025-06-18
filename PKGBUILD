# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='reco'
pkgver=5.1.0
pkgrel=1
pkgdesc='An audio recording app designed for elementary OS'
arch=('x86_64')
url='https://github.com/ryonakano/reco'
license=('GPL-3.0-or-later')
depends=('gstreamer' 'libpulse' 'ryokucha' 'live-chart' 'libadwaita')
makedepends=('meson' 'vala' 'libhandy' 'blueprint-compiler')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('875dcb5039a8676d1010d376b3b3fc9004c9ce6892cafcdd2ce430b6ea9c11cb')

build() {
  arch-meson "${pkgname}-${pkgver}" build -Duse_submodule=false
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  ln -s /usr/bin/com.github.ryonakano.reco "${pkgdir}/usr/bin/reco"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}
