pkgname=microbrust-git
_pkgname=microbrust
pkgver=r31.61b177e
pkgrel=4
pkgdesc='Linux interface to Arturia Microbrute'
arch=('i686' 'x86_64')
url='https://github.com/jmatraszek/microbrust'
license=('GPL3')
depends=('alsa-lib')
makedepends=('cargo' 'git')
source=("${pkgname%-*}::git+https://github.com/jmatraszek/microbrust.git")

sha1sums=('SKIP')

pkgver() {
  cd microbrust
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd microbrust
  cargo build --release
}

package() {
  cd microbrust
  install -D -m755 target/release/microbrust $pkgdir/usr/bin/microbrust
}
