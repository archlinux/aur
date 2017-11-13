# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=coreutils-git
pkgver=8.28.r32.ga4eedb251
pkgrel=1
pkgdesc="Basic file, shell and text manipulation utilities of the GNU operating system"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/coreutils/coreutils.html"
license=('GPL3')
depends=('glibc' 'gmp' 'libcap' 'openssl')
makedepends=('git' 'gettext' 'gperf' 'gzip' 'perl' 'rsync' 'tar' 'texinfo')
provides=('coreutils')
conflicts=('coreutils')
source=("git+https://git.savannah.gnu.org/git/coreutils.git")
sha256sums=('SKIP')


pkgver() {
  cd "coreutils"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "coreutils"

  ./bootstrap
  ./configure --prefix="/usr" --libexecdir="/usr/lib" --with-openssl --enable-no-install-program="groups,hostname,kill,uptime"
  make
}

check() {
  cd "coreutils"

  #make check
}

package() {
  cd "coreutils"

  make DESTDIR="$pkgdir" install
}
