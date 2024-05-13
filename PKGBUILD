# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>

pkgname=mecab-ipadic-git
_gitname=mecab
pkgrel=1
pkgver=r155.05481e7

pkgdesc="Yet another Japanese morphological analyzer (IPADIC dictionary)"
url="https://taku910.github.io/mecab"
license=(GPL-2.0-only)
arch=(x86_64)

depends=(mecab)
makedepends=(git)

provides=(mecab-ipadic)
conflicts=(mecab-ipadic)

source=("git+https://github.com/taku910/mecab.git")
b2sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname/mecab-ipadic"
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --with-charset=utf-8
  make
}

check() {
  cd "$_gitname/mecab-ipadic"
  make -k check
}

package() {
  cd "$_gitname/mecab-ipadic"
  make DESTDIR="$pkgdir/" install
}
