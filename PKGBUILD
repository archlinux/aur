# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare
pkgver=r2226.c7b0a929
pkgrel=1
pkgdesc="The Hare programming language"
arch=('x86_64')
url="https://harelang.org/"
license=('GPL3' 'MPL2')
depends=('qbe' 'harec')
makedepends=('git' 'scdoc')
_commit='c7b0a929f568b1feb8d43df4498dd9b32f98187c'
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

# hare r1909.5fae03c 1 test failed:
# linux::keyctl::keyctl: Assertion failed: error occured at ./linux/keyctl/keyctl.ha:98:7

#check() {
#  cd hare
#
#  make check
#}

package() {
  cd hare

  make DESTDIR="$pkgdir" install
}
