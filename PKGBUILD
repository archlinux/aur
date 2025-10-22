# Maintainer: Ayush <youremail@example.com>
_pkgname=staticwall
pkgname=${_pkgname}-git
pkgver=0.0.r25
pkgrel=1
pkgdesc="A lightweight Wayland wallpaper daemon written in C"
arch=('x86_64')
url="https://github.com/1ay1/staticwall"
license=('MIT')
depends=('wayland' 'egl-wayland' 'mesa' 'libpng' 'libjpeg-turbo')
makedepends=('git' 'base-devel' 'wayland' 'wayland-protocols' 'egl-wayland' 'mesa' 'libpng' 'libjpeg-turbo' 'pkgconf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/1ay1/staticwall.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname" || return 1
  printf "0.0.r%s" "$(git rev-list --count HEAD)"
}

prepare() {
  # nothing for now; add steps if repo needs autogen/config
  return 0
}

build() {
  cd "$srcdir/$_pkgname" || return 1
  make
}

package() {
  cd "$srcdir/$_pkgname" || return 1

  # correct path to the built binary
  install -Dm755 build/bin/staticwall "$pkgdir/usr/bin/staticwall"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # if you have sample config files
  # install -Dm644 config/config.vibe "$pkgdir/usr/share/doc/$pkgname/config.vibe"
}
