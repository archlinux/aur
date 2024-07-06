# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash-git
pkgver=r3767.3f6f0396
pkgrel=1
pkgdesc='Yet Another SHell is a POSIX-compliant command line shell'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://magicant.github.io/yash/'
license=('GPL-2.0-only')
depends=('ncurses')
makedepends=('asciidoc' 'ed')
provides=(yash)
conflicts=(yash)
options=('lto')
install="yash.install"
source=("git+https://github.com/magicant/yash"
        "yash.install")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "yash"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "yash"

  ./configure \
    --prefix=/usr \
    --enable-array \
    --enable-dirstack \
    --enable-double-bracket \
    --enable-help \
    --enable-history \
    --enable-lineedit \
    --enable-nls \
    --enable-printf \
    --enable-socket \
    --enable-test \
    --enable-ulimit

  make
}

check() {
  cd "yash"
  make check
}

package() {
  cd "yash"

  make install DESTDIR="${pkgdir}"
  install -Dm0644 doc/*.{css,html} -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm0644 doc/ja/*.{css,html} -t "${pkgdir}/usr/share/doc/${pkgname}/ja/"
}
