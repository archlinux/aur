# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Florian Daniel <fd@noxa.de>
# Contributor: Eldar Tsraev <elts@culab.org>
# Contributor: Andreas Guth <andreas.guth@rwth-aachen.de>
# Contributor: Alexander Neumann <alexander@bumpern.de>

options=(!strip)
pkgname=restic
pkgver=0.8.3
pkgrel=1
pkgdesc="restic is a program that does backups right."
arch=('i686' 'x86_64')
url="https://restic.github.io"
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("https://github.com/restic/restic/archive/v${pkgver}.tar.gz")
sha256sums=('0cf697c88404b180d6d6ff2e7d2c27b2fcb9536da6dbdf15ad4d320af7e8f17c')

#importpath='github.com/restic/restic'

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go run build.go
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "restic"    "${pkgdir}/usr/bin/restic"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/$pkgname/README"
  mkdir -p "$pkgdir/usr/share/man/man1"
  install -Dm644 -t "$pkgdir/usr/share/man/man1/" doc/man/*.1
}

# vim:set ts=2 sw=2 et:
