# Maintainer: Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributor: Martin Briza <m@rtinbriza.cz>

pkgname=adwaita-qt
pkgver=1.0.90
pkgrel=1
pkgdesc='A style to bend Qt applications to look like they belong into GNOME Shell'
arch=('x86_64')
url="https://github.com/MartinBriza/adwaita-qt"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'git')
optdepends=('qgnomeplatform: apply GNOME settings to Qt apps')
conflicts=('adwaita-qt-common' 'adwaita-qt-git')
replaces=('adwaita-qt-common' 'adwaita-qt-git')
source=("https://github.com/FedoraQt/adwaita-qt/archive/1.0.90.tar.gz")
sha256sums=('4e821ae7409fbf6e7b64f47838a9d0bc47793e788138ce1fd9609065b6e81009')

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
  install -Dm644 ../LICENSE.LGPL2 "${pkgdir}/usr/share/licences/${pkgname}/LICENSE"
}
