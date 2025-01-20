# Maintainer: Scott Panton <panton.scott@gmail.com>

pkgname=vban-git
pkgver=r97.4f69e5a
pkgrel=1
pkgdesc="An open-source implementation of a VBAN audio protocol receiver"
arch=('any')
url="https://github.com/quiniouben/vban"
depends=('alsa-lib' 'libpulse' 'jack')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/quiniouben/vban.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
