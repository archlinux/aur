pkgname=cmdcreate-git
pkgver=r524.fef787b
pkgrel=4
pkgdesc="Allows you to create custom commands for your custom scripts"
arch=('any')
url="https://github.com/owen-debiasio/cmdcreate"
license=('GPL3')

depends=('gcc-libs')
makedepends=('cargo' 'git')

conflicts=('cmdcreate' 'cmdcreate-debug')
provides=('cmdcreate')
options=('debug')

source=("cmdcreate::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd cmdcreate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd cmdcreate
  cargo build --release
}

package() {
  cd cmdcreate
  install -Dm755 target/release/cmdcreate "$pkgdir/usr/bin/cmdcreate"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cmdcreate/LICENSE"
}
