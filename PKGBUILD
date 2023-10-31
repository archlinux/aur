# Maintainer:
# Contributor: Fabio 'Lolix' Loli
# Contributor: piernov <piernov@piernov.org

pkgname=csl-git
pkgver=r458.3b9f221
pkgrel=2
pkgdesc='Cube Server Lister'
arch=('i686' 'x86_64')
url="https://github.com/aurhat/cubelister"
license=(GPL2)
depends=(wxwidgets-gtk3-3.0 wxwidgets-common-3.0 glibc gcc-libs geoip)
makedepends=(git intltool)
source=("git+https://github.com/aurhat/cubelister.git")
sha256sums=('SKIP')

pkgver() {
  cd cubelister
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd cubelister
  ./autogen.sh
}

build() {
  cd cubelister
  ./configure \
    --prefix=/usr \
    --disable-pch \
    --with-wx-config=/opt/wxgtk-3.0/bin/wx-config-gtk3

  make
}

package() {
  cd cubelister
  make DESTDIR=$pkgdir/ install
}
