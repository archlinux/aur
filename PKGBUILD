pkgname="kbct-git"
_gitname=kbct
pkgver=0.1.0.r45.7c2a54f
pkgrel=1
pkgdesc="Keyboard keycode mapping utility for Linux supporting layered configuration"
arch=('x86_64')
url="https://github.com/samvel1024/kbct"
license=('None')
depends=()
makedepends=('git' 'cargo' 'rust')
provides=('kbct')
source=("git+$url" 'kbct.service' 'config.yml')
backup=('etc/kbct/config.yml')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$_gitname"
    echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  cargo build --release
}

package() {
  cd "$_gitname"
  install -D -m755 ./target/release/kbct "$pkgdir/usr/bin/kbct"
  install -D -m644 "$srcdir/kbct.service" "$pkgdir/etc/systemd/system/kbct.service"
}
