# Maintainer: Mira Strannaya <rsxrwscjpzdzwpxaujrr@yahoo.com>
pkgname=mazemaze
pkgver=0.2.3
pkgrel=2
pkgdesc='Simple 3D OpenGL first-person maze game.'
url="https://github.com/rsxrwscjpzdzwpxaujrr/${pkgname}"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('jsoncpp' 'sfml')
optdepends=()
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
sfgui_commit='83471599284b2a23027b9ab4514684a6eeb08a19'
source=("https://github.com/rsxrwscjpzdzwpxaujrr/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/TankOs/SFGUI/archive/${sfgui_commit}.tar.gz")
sha256sums=('f56f9b2f930ef8b3257c13e99010beeb0b484e280b2f9125f1f0fa594cf73810'
            '4ff867c6f456288c228a7e62bdb9c0f9be28935741428513481017f59ec73809')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -d sfgui
  cd ..
  mv "SFGUI-${sfgui_commit}" "${srcdir}/${pkgname}-${pkgver}/sfgui"
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

