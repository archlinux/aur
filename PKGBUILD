# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=harec
pkgver=r1834.f9e17e6
pkgrel=1
pkgdesc='The Hare programming language - bootstrapped compiler'
arch=('x86_64' 'aarch64')
url='https://harelang.org/'
license=('GPL3')
depends=('qbe-git')
makedepends=('git')
_commit='f9e17e633845d8d38566b4ea32db0a29ac85d96e'
source=("git+https://git.sr.ht/~sircmpwn/harec#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd harec

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd harec

  # configure prefix directory & architecture
  sed \
    -e 's:/usr/local:/usr:' \
    -e "s/^ARCH = .*/ARCH = $CARCH/" \
    configs/linux.mk > config.mk
}

build() {
  cd harec

  make
}

check() {
  cd harec

  make check
}

package() {
  cd harec

  make DESTDIR="$pkgdir" install
}
