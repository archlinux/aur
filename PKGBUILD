# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=rnnoise-git
pkgver=0.2_r149.gd983458
pkgrel=1
pkgdesc="A noise suppression library based on a recurrent neural network"
arch=($CARCH)
url="https://github.com/xiph/${pkgname%-git}"
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
