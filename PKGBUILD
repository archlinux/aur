# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Dan Vratil <vratil@progdansoft.com>
# Contributor: Alex Jordan <alex at strugee dot net>

_srcname=libvterm
pkgname=libvterm-vwm
pkgver=9.0
pkgrel=1
_commit=65c8fc8ed27f361851b56e613fded1e837e54d62
pkgdesc="Terminal emulation library to mimic VT100 and rxvt capabilities"
arch=('i686' 'x86_64')
url="https://github.com/TragicWarrior/libvterm"
license=('GPLv2')
depends=('ncurses')
makedepends=('cmake' 'git')
source=("git+https://github.com/TragicWarrior/${_srcname}.git#commit=${_commit}"
        "ncurses-import.patch")
sha256sums=('SKIP'
            '43977c763e4f4179d26f1702280bc67bfa3841b775827100c95cd9569b768c22')


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
