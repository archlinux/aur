# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Contributor: Chris Brannon <cmbrannon (at) cox.net>

pkgname=pcc-libs-git
pkgver=20230806
pkgrel=4
pkgdesc="Libraries for the Portable C Compiler."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/PortableCC/"
license=('custom')
provides=(pcc-libs)
conflicts=(pcc-libs)
makedepends=('git')
options=('!lto')
source=($pkgname::git+https://github.com/PortableCC/pcc-libs.git license)
md5sums=('SKIP' '51f6cc02b26af53f26cfe87494ca5c87')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --date=format:"%Y%m%d" --format="%ad"
}

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr || return 1

  make CC=gcc || return 1
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR=$pkgdir install || return 1

  install -D -m0644 ${srcdir}/license ${pkgdir}/usr/share/licenses/${pkgname}/license
}
