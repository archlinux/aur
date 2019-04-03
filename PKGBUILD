# Maintainer: kpcyrd <git@rxv.cc>

_gitname=rshijack
pkgname=rshijack-git
pkgver=0.3.0.r0.g602a08b
pkgrel=1
pkgdesc="TCP connection hijacker, rust rewrite of shijack"
url="https://github.com/kpcyrd/rshijack"
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('rshijack')
conflicts=('rshijack')
arch=('i686' 'x86_64' 'armv6h')
license=('GPL3')
source=("git+https://github.com/kpcyrd/$_gitname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  cargo build --release --locked
}

package() {
  cd "$_gitname"
  install -Dm755 "target/release/${_gitname}" "$pkgdir/usr/bin/${_gitname}"
}

# vim:set ts=2 sw=2 et:
