# Maintainer: maz-1 <loveayawaka@gmail.com>

_gitname=telepathy-lwqq
pkgname=${_gitname}-git
pkgver=r27.dc12cb7
pkgrel=1
pkgdesc="Telepathy Connection Manager for QQ"
arch=(i686 x86_64)
url="https://github.com/xiehuc/telepathy-lwqq"
license=(GPL)
depends=(telepathy-glib lwqq)
makedepends=(cmake git)
source=("git+https://github.com/xiehuc/${_gitname}.git"
        "telepathy-lwqq.service")
md5sums=('SKIP'
        'SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_gitname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/telepathy \
    -DCMAKE_BUILD_TYPE=Release
  make VERBOSE=1
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm 644 ${srcdir}/telepathy-lwqq.service \
    ${pkgdir}/usr/share/dbus-1/services/org.freedesktop.Telepathy.ConnectionManager.lwqq.service
}

