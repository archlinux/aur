# Maintainer: gato_lento <vukk.euob at gmail>
pkgname=microbrust-git
_pkgname=microbrust
pkgver=r31.61b177e
pkgrel=3
pkgdesc='Linux interface to Arturia Microbrute'
arch=('i686' 'x86_64')
url='https://github.com/jmatraszek/microbrust'
license=('GPL3')
depends=('alsa-lib')
makedepends=('cargo')
source=("${pkgname%-*}::git+https://github.com/jmatraszek/microbrust.git")

sha1sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  cargo build
}

package() {
  cd $_pkgname
  install -D -m755 target/debug/microbrust $pkgdir/usr/bin/microbrust
}
