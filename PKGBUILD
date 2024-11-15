# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell-git
_pkgname=ags
pkgver=2.0.1.r0.gd8c2748
pkgrel=2
pkgdesc="Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system."
arch=('x86_64')
url="https://github.com/Aylur/ags"
license=('GPL-3.0-only')
makedepends=('git' 'go')
depends=('blueprint-compiler'
         'dart-sass'
         'gjs'
         'libastal-gjs'
         'libastal-meta'
         'npm')
source=("git+${url}.git")
sha256sums=('SKIP')
conflicts=('aylurs-gtk-shell')

pkgver(){
  cd $srcdir/$_pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${_pkgname}
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}


