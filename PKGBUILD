# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=clipit
pkgname=${_pkgname}-git
pkgver=0.259.f35db54
pkgrel=2
pkgdesc="Lightweight GTK+ clipboard manager"
url="https://github.com/CristianHenzel/ClipIt"
license=('GPL3')
arch=('x86_64')
conflicts=("${_pkgname}")
makedepends=('intltool')
depends=('gtk3' 'libappindicator-gtk3')
optdepends=('xdotool: for automatic paste')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${_pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh

  CFLAGS+=" -Wno-error=incompatible-pointer-types" ./configure \
    --prefix=/usr --sysconfdir=/etc --with-gtk3

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
