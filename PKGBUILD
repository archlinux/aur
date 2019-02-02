# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=autoconf-archive-git
pkgver=2019.01.06.r6.gd3b4a9f
pkgrel=2
pkgdesc="A collection of freely re-usable Autoconf macros"
arch=('any')
url="https://www.gnu.org/software/autoconf-archive/"
license=('GPL3' 'custom')
depends=('autoconf')
optdepends=('automake: macros for use with it')
makedepends=('git' 'python')
provides=('autoconf-archive')
conflicts=('autoconf-archive')
source=("git+https://git.savannah.gnu.org/git/autoconf-archive.git")
sha256sums=('SKIP')


prepare() {
  cd "autoconf-archive"

  git submodule add --force --depth 1 https://git.savannah.gnu.org/git/gnulib.git
}

pkgver() {
  cd "autoconf-archive"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "autoconf-archive"

  ./bootstrap.sh
  ./configure --prefix="/usr"
  make maintainer-all
  make
}

package() {
  cd "autoconf-archive"

  make DESTDIR="$pkgdir" install
}
