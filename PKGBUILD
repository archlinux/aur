# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell
_pkgname=ags
pkgver=2.0.1
pkgrel=2
pkgdesc="Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system."
arch=('x86_64')
url="https://github.com/Aylur/ags"
license=('GPL-3.0-only')
makedepends=('go')
depends=('blueprint-compiler'
         'dart-sass'
         'gjs'
         'libastal-gjs'
         'libastal-meta'
         'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aylur/ags/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1ea1e80b626e3fa69ca11f1fa2149f5ad3aae2c1cffc7d549d44728236c2daf6')
conflicts=('aylurs-gtk-shell-git')
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

