# Maintainer: Adam Reichold <adam.reichold@t-online.de>

pkgname=qmediathekview-git
pkgver=r131.602a3f4
pkgrel=1
pkgdesc='An alternative front-end to the MediathekView database. (development version)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/adamreichold/QMediathekView'
license=('GPL3')
depends=('qt6-base' 'hicolor-icon-theme')
optdepends=('vlc: for direct playback of shows')
makedepends=('git' 'qt6-tools' 'rust' 'cargo')
conflicts=('qmediathekview')
source=('git+https://github.com/adamreichold/QMediathekView.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/QMediathekView"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/QMediathekView"

  # disable LTO since this breaks linking static libraries built by GCC into the static library built by rustc into the binary built by GCC,
  # c.f. https://github.com/adamreichold/QMediathekView/issues/18
  qmake6 CONFIG-=ltcg
  make
}

package() {
  cd "$srcdir/QMediathekView"

  make "INSTALL_ROOT=$pkgdir" install
}
