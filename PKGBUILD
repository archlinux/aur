# Maintainer: Joseph Diza <josephm.diza@gmail.com>
pkgname=alphasort-git
pkgver=1.0.0
pkgrel=1
arch=('any')
pkgdesc='Alphabetizes word lists' 
url='https://github.com/jmdaemon/alphasort'
license=('AGPL3')
options=(!strip) # Mandatory as stripping the binary removes the sbcl runtime
depends=('sbcl')
optdepends=()
makedepends=('git' 'make')
source=("$pkgname::git+https://github.com/jmdaemon/alphasort")
provides=(alphasort)
conflicts=(alphasort)
sha512sums=("SKIP")

build() {
  cd "$pkgname"
  export DESTDIR="$pkgdir"
  export PREFIX="/usr"
  make build
}

package-bin() {
    BIN_DIR="$pkgdir"/usr/bin
    mkdir -p $BIN_DIR
    install bin/alphasort "$pkgdir/usr/bin/alphasort"
}

package() {
  cd "$pkgname"
  package-bin
}
