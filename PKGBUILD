# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash-git
pkgver=r3637.e0e50112
pkgrel=1
pkgdesc='Yet Another SHell is a POSIX-compliant command line shell'
arch=('x86_64' 'armv7h')
url='http://sourceforge.jp/projects/yash/'
license=('GPL')
depends=(ncurses)
makedepends=(asciidoc)
provides=(yash)
conflicts=(yash)
install=yash.install
source=(git+https://github.com/magicant/yash
        yash.install)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "yash"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd yash

  ./configure \
    --prefix=/usr \
    --enable-array \
    --enable-dirstack \
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

package() {
  cd yash

  make install DESTDIR="${pkgdir}"
}
