# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Dan Vratil <vratil@progdansoft.com>
# Contributor: Alex Jordan <alex at strugee dot net>

_srcname=libvterm
pkgname=libvterm-vwm
pkgver=9.3
pkgrel=1
_commit=55d7c847ba0fc7859708468da062a8493c3a9eff
pkgdesc="Terminal emulation library to mimic VT100 and rxvt capabilities"
arch=('i686' 'x86_64')
url="https://github.com/TragicWarrior/libvterm"
license=('GPLv2')
depends=('ncurses')
makedepends=('cmake' 'git')
source=("git+https://github.com/TragicWarrior/${_srcname}.git#commit=${_commit}"
        "ncurses-import.patch")
sha256sums=('SKIP'
            '90c511a2fa7822813294e215c756691f170c7083c7344135ac6b3ed780e5d4ce')


prepare() {
  mkdir -p build
  patch -Np0 -i ncurses-import.patch
}

build() {
  cd build
  cmake ../${_srcname} \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
