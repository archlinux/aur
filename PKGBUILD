# Maintainer: Maximilian Stejskal <aur.max@sngn.net>

pkgname='s3backer-git'
pkgver=r827.6a07e58
pkgrel=1
pkgdesc="FUSE-based single file backing store via Amazon S3 compatible services"
arch=('x86_64')
provides=('s3backer')
conflicts=('s3backer')
url="https://github.com/archiecobbs/s3backer"
license=('GPL')
makedepends=('git')
depends=('curl' 'expat' 'fuse2')
optdepends=('nbdkit')
source=("$pkgname::git+https://github.com/archiecobbs/s3backer")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  set -e
  . ./cleanup.sh
  mkdir m4
  autoreconf -iv
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="$pkgdir/" install
}
