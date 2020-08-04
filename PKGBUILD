# Maintainer: Mira Strannaya <rsxrwscjpzdzwpxaujrr@yahoo.com>
pkgname=mazemaze-git
pkgver=0.2.1.r57.gb274ac6
pkgrel=1
pkgdesc='Simple 3D OpenGL first-person maze game.'
url="https://mira-strannaya.ru/articles/mazemaze"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('jsoncpp' 'sfml' 'sfgui')
optdepends=()
makedepends=('jsoncpp' 'sfml' 'git' 'sfgui')
conflicts=()
replaces=()
backup=()
source=("git+https://github.com/mirai65536/mazemaze")
md5sums=('SKIP')

pkgver() {
  cd mazemaze
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/mazemaze"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DSFGUI_SUBMODULE=OFF
  make
}

package() {
  cd "${srcdir}/mazemaze/build"
  make DESTDIR="${pkgdir}" install
  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 FONT_LICENSE "$pkgdir/usr/share/licenses/$pkgname/FONT_LICENSE"
}

