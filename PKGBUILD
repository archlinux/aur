# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell
_pkgname=ags
pkgver=2.3.0
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
sha256sums=('3566ec00ef0e6619e7a554cee73c91dd4ea6087bcacb18798c70efe04d8926ef')
install=ags.install

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="$srcdir"
  go build -o ${_pkgname}
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}

