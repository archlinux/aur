# Maintainer: Mira Strannaya <rsxrwscjpzdzwpxaujrr@yahoo.com>
pkgname=mazemaze
pkgver=0.2.3
pkgrel=1
pkgdesc='Simple 3D OpenGL first-person maze game.'
url="https://github.com/rsxrwscjpzdzwpxaujrr/${pkgname}"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('jsoncpp' 'sfml')
optdepends=()
makedepends=('git' 'cmake')
conflicts=()
replaces=()
backup=()
source=("https://github.com/rsxrwscjpzdzwpxaujrr/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f56f9b2f930ef8b3257c13e99010beeb0b484e280b2f9125f1f0fa594cf73810')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  git clone https://github.com/TankOs/SFGUI.git
  rm -d sfgui
  mv SFGUI sfgui
  cd sfgui
  git checkout 8347159 --quiet
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DSFGUI_SUBMODULE=ON
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 FONT_LICENSE "$pkgdir/usr/share/licenses/$pkgname/FONT_LICENSE"
}

