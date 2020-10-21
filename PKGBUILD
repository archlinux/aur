# Maintainer: Mira Strannaya <rsxrwscjpzdzwpxaujrr@yahoo.com>
_pkgname=mazemaze
pkgname="${_pkgname}-git"
pkgver=0.2.1.r69.gcff7079
pkgrel=3
pkgdesc='Simple 3D OpenGL first-person maze game.'
url="https://mira-strannaya.ru/articles/${_pkgname}"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('jsoncpp' 'sfml' 'sfgui')
optdepends=()
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
source=("git+https://github.com/mirai65536/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd mazemaze
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DSFGUI_SUBMODULE=OFF
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 FONT_LICENSE "$pkgdir/usr/share/licenses/${pkgname}/FONT_LICENSE"
}

