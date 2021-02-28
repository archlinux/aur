# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsmbios-git
pkgver=2.4.3.r3.gf01a217
pkgrel=1
pkgdesc="Library for interacting with SMBIOS tables"
arch=('i686' 'x86_64')
url="https://github.com/dell/libsmbios"
license=('GPL' 'custom')
depends=('glibc')
makedepends=('git' 'libxml2' 'python')
optdepends=('python: tools')
provides=('libsmbios')
conflicts=('libsmbios')
options=('staticlibs')
source=("git+https://github.com/dell/libsmbios.git")
sha256sums=('SKIP')


pkgver() {
  cd "libsmbios"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libsmbios"

  ./autogen.sh --no-configure
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc"
  make
}

check() {
  cd "libsmbios"

  make check
}

package() {
  cd "libsmbios"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING{,-OSL} -t "$pkgdir/usr/share/licenses/libsmbios"
}
