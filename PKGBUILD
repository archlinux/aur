# Maintainer: yvs <VSYakovetsky@gmail.com>

_ver="0.3"
_tag="d3da356"
_build="_build"

pkgname=pingpath
pkgver="$_ver"
pkgrel=1
pkgdesc="ping wrapper to display path"
arch=('x86_64' 'aarch64')
url="https://github.com/yvs2014/$pkgname"
license=('GPL-2.0-or-later')
depends=('iputils' 'gtk4' 'json-glib' 'libglvnd' 'libepoxy' 'cglm')
makedepends=('git' 'gcc' 'cmake' 'pkgconf')
options=(strip !debug)

source=("$pkgname::git+$url")
provides=("$pkgname")

build() {
  cmake -B "$_build" -S "$pkgname" -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  cmake --build "$_build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$_build"
}

pkgver() {
  cd "$pkgname"
  printf "%s.r%s.%s" "$_ver" "$(git rev-list --count ${_tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

sha256sums=('SKIP')
