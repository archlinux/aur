# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash-git
pkgver=2.51
pkgrel=1
pkgdesc='Yet Another SHell is a POSIX-compliant command line shell'
arch=('x86_64' 'armv7h')
url='http://sourceforge.jp/projects/yash/'
license=('GPL')
depends=('ncurses')
provides=(yash)
conflicts=(yash)
install=yash.install
source=(git+https://github.com/magicant/yash
        yash.install)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd yash
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
