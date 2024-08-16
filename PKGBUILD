# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='reco'
pkgver=5.0.2
pkgrel=1
pkgdesc='An audio recording app designed for elementary OS'
arch=('x86_64')
url='https://github.com/ryonakano/reco'
license=('GPL3')
depends=('granite7' 'gstreamer' 'libpulse' 'ryokucha' 'live-chart')
makedepends=('meson' 'vala' 'libhandy')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c63206e107e571ebfdda2975ac1aea9a5c1b078ac225d5d1fa293e99f8079667')

build() {
  arch-meson "${pkgname}-${pkgver}" build -Duse_submodule=false
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  ln -s /usr/bin/com.github.ryonakano.reco "${pkgdir}/usr/bin/reco"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}
