# Maintainer: Mira Strannaya <rsxrwscjpzdzwpxaujrr@yahoo.com>
pkgname=mazemaze
pkgver=0.2.2
pkgrel=1
pkgdesc='Simple 3D OpenGL first-person maze game.'
url="https://mira-strannaya.ru/articles/mazemaze"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('jsoncpp' 'sfml' 'sfgui')
optdepends=()
makedepends=('git' 'cmake')
conflicts=()
replaces=()
backup=()
source=("https://github.com/mirai65536/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2a43e6399005b616465cd6e9fe12a54069a250d4537d05999c9b7aa45fec7a15')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DSFGUI_SUBMODULE=OFF
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 FONT_LICENSE "$pkgdir/usr/share/licenses/$pkgname/FONT_LICENSE"
}

