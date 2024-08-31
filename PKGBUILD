# Maintainer: yvs <VSYakovetsky@gmail.com>

_ver="0.85"
_tag="97af563"
_bin="mtr"

pkgname=mtr085
pkgver="$_ver"
pkgrel=1
pkgdesc="Full screen ncurses traceroute tool, mtr v0.85 fork"
arch=('x86_64' 'aarch64')
url="https://github.com/yvs2014/$pkgname"
license=('GPL-2.0')
depends=('ncurses' 'libidn2' 'libcap')
makedepends=('git' 'gcc' 'make' 'automake' 'autoconf' 'pkgconf')
options=(strip !debug)

conflicts=('mtr' 'mtr-gtk')

source=("$pkgname::git+$url")
provides=("$_bin")

build() {
  cd "$pkgname"
  autoreconf -fi
  ./configure --prefix=/usr --with-libidn
  make
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" make install
}

pkgver() {
  cd "$pkgname"
  printf "%s.r%s.%s" "$_ver" "$(git rev-list --count ${_tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

sha256sums=('SKIP')
