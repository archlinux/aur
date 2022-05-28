# Maintainer: Deckweiss <Deckweiss75@gmail.com>

_name="xinputd"
pkgname="${_name}-git"
pkgver=1.0.0e0bd7c
pkgrel=1
pkgdesc="Xinputd is a simple daemon that executes a command when an Xorg input device is added or removed. By default, Xinputd forks to background and exits when the X server exits."
arch=('any')
url="https://github.com/bbenne10/${_name}"
license=('MIT')
depends=(asciidoc)
optdepends=()
makedepends=('git')
conflicts=(${_name})
provides=(${_name})
source=("git+https://github.com/bbenne10/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "1.0.%s" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_name"

  make
}

package() {
  cd "$_name"

  make DESTDIR="$pkgdir/" xinputd.1
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
