# Maintainer: rws <elisp dot vim at google mail> (@xd1le on twitter)

_pkgname=clog
pkgname=${_pkgname}-git
pkgver=111
pkgrel=1
pkgdesc='A conventional changelog for the rest of us'
arch=('i686' 'x86_64')
url="https://github.com/thoughtram/${_pkgname}"
license=('MIT')
makedepends=('git' 'rust' 'cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/thoughtram/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "${pkgdir}/usr/bin"
  cp -p target/release/clog "${pkgdir}/usr/bin"
}
