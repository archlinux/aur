# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=coreutils-git
pkgver=9.7.r292.gf4dcc2a49
pkgrel=1
pkgdesc="Basic file, shell and text manipulation utilities of the GNU operating system"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/coreutils/coreutils.html"
license=('GPL-3.0-or-later')
depends=('glibc' 'gmp' 'libcap' 'openssl')
makedepends=('git' 'gettext' 'gperf' 'gzip' 'perl' 'rsync' 'tar' 'texinfo' 'wget')
provides=("coreutils=$pkgver")
conflicts=('coreutils')
source=("git+https://https.git.savannah.gnu.org/git/coreutils.git")
sha256sums=('SKIP')


pkgver() {
  cd "coreutils"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "coreutils"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --libexecdir="/usr/lib" \
    --with-openssl \
    --enable-no-install-program="hostname,kill,uptime"
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
