# Contributor: Iru Dog <mytbk920423 at gmail.com>
# Maintainer: Iru Dog <mytbk920423 at gmail.com>
pkgname=fqterm-git
pkgver=0.9.10.1.1.g55d08df
pkgrel=1
pkgdesc='a terminal emulator used for Telnet-based BBS, with Telnet and SSH support'
arch=('i686' 'x86_64')
url='https://github.com/mytbk/fqterm/'
license=('GPL2')
depends=('qt5-script' 'qt5-tools' 'qt5-multimedia')
makedepends=('git' 'cmake')
provides=('fqterm')
conflicts=('fqterm' 'fqterm-svn')
source=('git+https://github.com/mytbk/fqterm.git')
md5sums=('SKIP')

pkgver(){
  cd "${srcdir}/fqterm"
  git describe --always | tr '-' '.'
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_C_FLAGS="${CFLAGS}" \
      -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
      ../fqterm
  make
}

package(){
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir/" install
}
