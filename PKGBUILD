# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare
pkgver=r2241.cb9b5872
pkgrel=1
pkgdesc='The Hare programming language'
arch=('x86_64')
url='https://harelang.org/'
license=('GPL3' 'MPL2')
depends=('qbe' 'harec')
makedepends=('git' 'scdoc')
_commit='cb9b5872b39999f26ae57a994a3d932e449f89dd'
source=(
  "hare::git+https://git.sr.ht/~sircmpwn/hare#commit=$_commit"
)
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd hare

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd hare

  sed "s:/usr/local:/usr:" config.example.mk > config.mk
}

build() {
  cd hare

  make
}

check() {
  cd hare

  make check
}

package() {
  cd hare

  make DESTDIR="$pkgdir" install
}
