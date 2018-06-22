# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sbsigntools-git
pkgver=0.9.1.r0.ga631793
pkgrel=1
pkgdesc="Signing utility for UEFI secure boot"
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git"
license=('GPL3')
depends=('glibc' 'libutil-linux' 'openssl')
makedepends=('git' 'gnu-efi-libs' 'help2man')
provides=('sbsigntools')
conflicts=('sbsigntools')
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git")
sha256sums=('SKIP')


pkgver() {
  cd "sbsigntools"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "sbsigntools"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd "sbsigntools"

  make check
}

package() {
  cd "sbsigntools"

  make DESTDIR="$pkgdir" install
}
