# Maintainer: Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributor: Martin Briza <m@rtinbriza.cz>

pkgname=adwaita-qt4
pkgver=1.0
pkgrel=1
pkgdesc='A style to bend Qt applications to look like they belong into GNOME Shell'
arch=('x86_64')
url="https://github.com/MartinBriza/adwaita-qt"
license=('GPL')
depends=('qt4')
makedepends=('cmake' 'git')
optdepends=('qgnomeplatform: apply GNOME settings to Qt apps')
conflicts=('adwaita-qt-common' 'adwaita-qt-git')
replaces=('adwaita-qt-common' 'adwaita-qt-git')
source=("https://github.com/FedoraQt/adwaita-qt/archive/1.0.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT4=ON \
    -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 ../LICENSE.LGPL2 "${pkgdir}/usr/share/licences/${pkgname}/LICENSE"
}

sha256sums=('c2c0c71b131d0e3e58ee108570796cf70b35dccaa64ce17915d4486de5e91513')