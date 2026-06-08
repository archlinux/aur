# Maintainer: 7erez <your-email@example.com>
pkgname=7sh-git
pkgver=1.0.r3.890a213
pkgrel=1
pkgdesc="A minimal POSIX-compliant custom shell with native UTF-8 support by 7erez"
arch=('x86_64' 'aarch64')
url="https://github.com/the7erez/7sh"
license=('MIT')
depends=('glibc')
makedepends=('git' 'gcc' 'make')
provides=('7sh')
conflicts=('7sh')
install=7sh.install
source=("git+https://github.com/the7erez/7sh.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make clean && make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 bin/7sh "$pkgdir/usr/bin/7sh"
}
