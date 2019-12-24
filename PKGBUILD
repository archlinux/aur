# Maintainer: DuckSoft <realducksoft@gmail.com>

pkgname='s3backer-git'
pkgver=r509.2ecf161
pkgrel=1
pkgdesc="FUSE-based single file backing store via Amazon S3"
arch=('x86_64')
provides=('s3backer')
conflicts=('s3backer')
url="https://github.com/archiecobbs/s3backer"
license=('GPL')
depends=('fuse2' 'curl' 'expat' 'openssl' 'zlib')
source=("$pkgname::git+https://github.com/archiecobbs/s3backer")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure --prefix="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install
}
