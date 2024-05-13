# Maintainer: yvs <VSYakovetsky@gmail.com>

_bver="0.3"
_gtag="d3da356"

pkgname=pingpath
pkgver="$_bver"
pkgrel=1
pkgdesc="ping wrapper to display path"
arch=('x86_64' 'aarch64')
url="https://github.com/yvs2014/$pkgname"
license=('GPL-2.0-or-later')
depends=('iputils' 'gtk4' 'json-glib' 'libglvnd' 'libepoxy' 'cglm')
makedepends=('git' 'gcc' 'make' 'pkgconf')
options=(strip !debug)

source=("$pkgname::git+$url")
provides=("$pkgname")

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  PREFIX=/usr DESTDIR="$pkgdir" make install
}

pkgver() {
  cd "$pkgname"
  printf "%s.r%s.%s" "$_bver" "$(git rev-list --count ${_gtag}..HEAD)" "$(git rev-parse --short HEAD)"
}

sha256sums=('SKIP')
