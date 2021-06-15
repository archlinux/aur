# Maintainer: tinywrkb <tinywrkb@gmail.com>

pkgname=fsverity-utils
pkgver=1.4
pkgrel=1
pkgdesc='Userspace utilities for fs-verity'
url='https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git'
license=('custom:MIT')
source=("${url}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('587f95bb724602fa1682877a3755e7ad557d77ffce77ff8c1e4f97cf1c31147c')
arch=('x86_64')
depends=('openssl')
makedepends=('pandoc')

build() {
  cd ${pkgname}-${pkgver}
  make USE_SHARED_LIB=1 PREFIX=/usr DESTDIR=${pkgdir}
}

package() {
  cd ${pkgname}-${pkgver}
  make USE_SHARED_LIB=1 PREFIX=/usr DESTDIR=${pkgdir} install
  make USE_SHARED_LIB=1 PREFIX=/usr DESTDIR=${pkgdir} install-man
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm644 README.md -t ${pkgdir}/usr/share/doc/${pkgname}/
}
