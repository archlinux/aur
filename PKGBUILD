# Maintainer: kpcyrd <git@rxv.cc>

_gitname=sn0int
pkgname=sn0int-registry-git
pkgver=0.1.0.r1.ga1448ed
pkgrel=1
pkgdesc="sn0int-registry"
url="https://github.com/kpcyrd/sn0int"
depends=('curl' 'postgresql-libs')
makedepends=('rustup')
provides=('sn0int-registry')
conflicts=('sn0int-registry')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
source=("git+https://github.com/kpcyrd/$_gitname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname/sn0int-registry"
  cargo build --release --locked
}

check() {
  cd "$_gitname/sn0int-registry"
  cargo test --release --locked
}

package() {
  cd "$_gitname"
  install -Dm755 "target/release/sn0int-registry" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_gitname"
}

# vim:set ts=2 sw=2 et:
