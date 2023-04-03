# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=grep-git
pkgver=3.10.r2.gc63a095
pkgrel=1
pkgdesc="A string search utility"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/grep/"
license=('GPL3')
depends=('glibc' 'pcre2')
makedepends=('git' 'gettext' 'gperf' 'gzip' 'perl' 'rsync' 'tar' 'texinfo')
provides=("grep=$pkgver")
conflicts=('grep')
source=("git+https://git.savannah.gnu.org/git/grep.git")
sha256sums=('SKIP')


pkgver() {
  cd "grep"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "grep"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "grep"

  make check
}

package() {
  cd "grep"

  make DESTDIR="$pkgdir" install
}
