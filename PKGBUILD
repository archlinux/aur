# Maintainer: Martin Chang <marty188586 at gmail dot com>
pkgname=restool
pkgver=18.06
pkgrel=0
pkgdesc="An user space application providing the ability to dynamically create and manage NXP DPAA2 containers and objects from Linux."
arch=('aarch64' 'armv7h' 'armv6h')
url="https://github.com/qoriq-open-source/restool"
license=('GPL')
depends=()
makedepends=(git make gcc)
provides=(restool)
source=("git+https://github.com/qoriq-open-source/restool.git")
sha1sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  # Patch the code to compile properly
  find -type f -name '*.c' | xargs sed -i 's/^enum mc_cmd_status mc_status;/static enum mc_cmd_status mc_status;/'
  sed -i '/-Werror \\/d' Makefile

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" prefix="/usr/" install
}
