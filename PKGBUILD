# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Florian Daniel <fd@noxa.de>
# Contributor: Eldar Tsraev <elts@culab.org>
# Contributor: Andreas Guth <andreas.guth@rwth-aachen.de>
# Contributor: Alexander Neumann <alexander@bumpern.de>

options=(!strip)
pkgname=restic
pkgver=0.7.2
pkgrel=1
pkgdesc="restic is a program that does backups right."
arch=('i686' 'x86_64')
url="https://restic.github.io"
license=('BSD')
depends=('glibc')
makedepends=('go>=1.7')
conflicts=('restic-git')
source=("https://github.com/restic/restic/archive/v${pkgver}.tar.gz")
sha256sums=('1219aed961e396fb1be1c2a86218cc72de87bcc4461f22f9d87cd1fccf7fc30c')

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
