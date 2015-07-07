# Maintainer: Zoltan Tombol <zoltan (dot) tombol (plus) aur (at) gmail (dot) com>

pkgname=varrick-git
pkgver=0.2.0.r0.g20ffcc1
pkgrel=1
pkgdesc="A convenient template engine to just 'Do the thing!'"
arch=(any)
url="https://github.com/ztombol/varrick"
license=('GPL3')
depends=('bash' 'sed')
makedepends=('git' 'ruby-ronn')
checkdepends=('bats-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ztombol/${pkgname%-git}")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make build
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make -k check
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       LIBEXECDIR='/usr/lib' \
       install
}

# vim:set ts=2 sw=2 et:
