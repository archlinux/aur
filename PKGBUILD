# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=meson++
pkgname=$_pkgname-git
pkgver=r582.3f30fd9
pkgrel=1
pkgdesc="an experimental and incomplete implementation of Meson in C++, for solving Meson's bootstrapping issue"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/dcbaker/meson-plus-plus
license=(GPL3)
makedepends=(git meson)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+$url#tag=3f30fd9bfe54d7e074a273cbd680dce67cabe4eb")
sha256sums=(SKIP)

pkgver() {
  cd meson-plus-plus || return 1
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson meson-plus-plus build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
