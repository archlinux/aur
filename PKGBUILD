# Maintainer: archlinux.info:tdy

pkgname=nuvolaplayer-git
pkgver=r1020.78b0333
pkgrel=1
pkgdesc="Cloud music integration for your Linux desktop"
arch=(i686 x86_64)
url=https://tiliado.eu/nuvolaplayer
license=(GPL)
depends=(diorite-git webkit2gtk libarchive)
makedepends=(git python vala)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+https://github.com/tiliado/${pkgname/-/.})
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  python waf configure --prefix=/usr
  python waf build
}

package() {
  cd $pkgname
  python waf install --no-system-hooks --destdir="$pkgdir"
}
