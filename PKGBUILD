# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=clipit
pkgname=${_pkgname}-git
pkgver=0.259.f35db54
pkgrel=5
pkgdesc="Lightweight GTK+ clipboard manager"
arch=('x86_64')
url="https://github.com/CristianHenzel/ClipIt"
license=('GPL-3.0-or-later')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('gtk3' 'libappindicator-gtk3')
makedepends=('git' 'intltool')
optdepends=('xdotool: for automatic paste')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${_pkgname}
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}"/${_pkgname}

  ./autogen.sh

  CFLAGS+=" -Wno-error=incompatible-pointer-types" ./configure \
    --prefix=/usr --sysconfdir=/etc --with-gtk3

  make
}

package() {
  cd "${srcdir}"/${_pkgname}

  make DESTDIR="${pkgdir}" install
}
