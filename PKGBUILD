# Maintainer: ._______166 <retromac9x2@gmail.com>
pkgname=lockdate-git
pkgver=r1.9ca27e0
pkgrel=1
pkgdesc="custom impl of date that allows for formatting in other calendars"
arch=('x86_64')
license=('MIT')
provides=('lockdate')
depends=()
makedepends=('git' 'cargo')
optdepends=()
source=('misc::git+https://github.com/dot166/misc') # lockdate lives in my metarepo, thats why it clones misc
sha256sums=('SKIP')

pkgver() {
  cd "misc"
  printf "r%s.%s" "$(git rev-list --count HEAD -- ./lockdate)" "$(git rev-parse --short=7 HEAD -- ./lockdate)"
}

build() {
  cd "misc/lockdate"
  cargo build --release
}

package() {
  cd "misc/lockdate"
  install -Dm755 target/release/lockdate "$pkgdir/usr/bin/lockdate"
}
