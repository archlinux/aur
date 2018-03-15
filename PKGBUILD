# Maintainer: kpcyrd <git@rxv.cc>

_gitname=badtouch
pkgname=badtouch-git
pkgver=0.1.0.r0.g5a7a2d4
pkgrel=1
pkgdesc="Scriptable network authentication cracker"
url="https://github.com/kpcyrd/badtouch"
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('badtouch')
conflicts=('badtouch')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
source=("git+https://github.com/kpcyrd/$_gitname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  cargo build --release
}

check() {
  cd "$_gitname"
  cargo test --release
}

package() {
  cd "$_gitname"
  install -Dm755 "target/release/$_gitname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_gitname"
}

# vim:set ts=2 sw=2 et:
