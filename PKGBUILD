# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgdesc='Dynamic, bytecode-compiled programming language and a dialect of Python (development version)'
pkgname='kuroko-git'
pkgver=1.4.0.r47.ge413643
pkgrel=1
url='https://github.com/kuroko-lang/kuroko'
arch=('aarch64' 'x86_64')
conflicts=('kuroko')
depends=('glibc')
license=('MIT')
makedepends=('git')
options=('lto')
provides=('kuroko' 'libkuroko')
sha256sums=('SKIP')
source=("git+$url.git")
_pkgname='kuroko'

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  make -C "$_pkgname" prefix=/usr
}

check () {
  make -C "$_pkgname" prefix=/usr test
}

package () {
  make -C "$_pkgname" prefix=/usr DESTDIR="$pkgdir" install

  # Be more verbose if standard output is a TTY
  test -t 1 && _v='v' || _v=''

  install "-${_v}Dm0644" "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
