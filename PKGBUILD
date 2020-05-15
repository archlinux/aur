# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Aniket Pradhan <aniket17133 (at) iiitd (dot) ac (dot) in>
# Contributor: Martin Briza <m (at) rtinbriza (dot) cz>

pkgname=adwaita-qt4
_pkgname=adwaita-qt
pkgver=1.1.3
pkgrel=1
pkgdesc='A style to bend Qt applications to look like they belong into GNOME Shell'
arch=('x86_64')
url="https://github.com/FedoraQt/adwaita-qt"
license=('GPL')
depends=('qt4')
makedepends=('cmake' 'git')
optdepends=('qgnomeplatform: apply GNOME settings to Qt apps')
source=("https://github.com/FedoraQt/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2d798ff3a45065c7c89fd17e6d98ce6a5890ac789839c9d49df672f695f46ddd')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT4=ON \
    -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 ../LICENSE.LGPL2 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
