# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Aniket Pradhan <aniket17133 (at) iiitd (dot) ac (dot) in>
# Contributor: Martin Briza <m (at) rtinbriza (dot) cz>

pkgname=adwaita-qt
pkgver=1.2.0
pkgrel=1
pkgdesc='A style to bend Qt applications to look like they belong into GNOME Shell'
arch=('x86_64')
url="https://github.com/FedoraQt/adwaita-qt"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'git')
optdepends=('qgnomeplatform: apply GNOME settings to Qt apps')
source=("https://github.com/FedoraQt/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5698025e1fe3479397516e504c20943611afe040c89dca6531c309fd4198cc6b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 ../LICENSE.LGPL2 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
