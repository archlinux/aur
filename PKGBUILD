pkgname='lockbook'
_pkgname="lockbook"
pkgver=0.2.11
pkgrel=3
arch=('x86_64' 'i686')
url="https://github.com/lockbook/lockbook"
pkgdesc="A secure, private, minimal, cross-platform document editor."
license=('BSD-3-Clause')
makedepends=('rust' 'cargo' 'git')
provides=('lockbook')
conflicts=('lockbook')
source=("$_pkgname::git+https://github.com/lockbook/lockbook.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname/clients/cli
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1)"
}

build(){
  cd $_pkgname/clients/cli
  env API_URL="http://api.lockbook.app:8000" cargo build --release
}

package_lockbook() {
  cd $_pkgname/clients/cli
  install -D -m755 "target/release/lockbook" "$pkgdir/usr/bin/lockbook"
}

