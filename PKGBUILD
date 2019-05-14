# Creator: Herbert Knapp <herbert.knapp@edu.uni-graz.at>
# Maintainer:

pkgname=phoenixfs-git
pkgver=r115.6ea03d9
pkgrel=1
pkgdesc='A versioning filesystem inspired by git'
arch=('any')
url='https://github.com/artagnon/phoenixfs'
license=('MIT')
depends=('fuse2')
source=("${pkgname}"::"git://github.com/artagnon/phoenixfs.git")
sha256sums=('SKIP')
pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  sed -i 's/^\(CFLAGS\ =.*\)$/\1 -O -Wno-error=format-overflow=/' Makefile
  mkdir -p "${pkgdir}/usr/bin/"
  make clean && make
  install -m 755 phoenixfs "${pkgdir}/usr/bin/"
}
