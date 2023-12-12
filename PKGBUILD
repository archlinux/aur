# Maintainer: Your Name <your email>
pkgname=dashlane-cli
pkgver=1.15.1
pkgrel=1
pkgdesc="Dashlane CLI"
arch=('any')
url="https://github.com/Dashlane/dashlane-cli"
license=('MIT')
depends=()
makedepends=('git' 'asdf-vm')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
options=("!strip")

prepare() {
  asdf install
  cd "$srcdir/$pkgname"
  yarn install
}

build() {
  cd "$srcdir/$pkgname"
  yarn run build
}

package() {
  cd "$srcdir/$pkgname"
  # yarn run pkg
  # yarn run pkg:linux
  yarn exec pkg . -t latest-linux-x64 -o bundle/dcli-linux
  install -Dm755 "$srcdir/$pkgname/bundle/dcli-linux" "$pkgdir/usr/bin/dcli"
}