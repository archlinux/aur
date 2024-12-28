# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell
_pkgname=ags
pkgver=2.2.1
pkgrel=1
pkgdesc="Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system."
arch=('x86_64')
url="https://github.com/Aylur/ags"
license=('GPL-3.0-only')
makedepends=('go')
depends=('blueprint-compiler'
         'dart-sass'
         'gjs'
         'gobject-introspection'
         'libastal-gjs'
         'libastal-meta'
         'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aylur/ags/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('55bf060099bed245c9a0973d9bd49a7d927cd07539c329878eb33a9001299695')
install=ags.install

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${_pkgname}
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}

