# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libguess-git
pkgver=1.2.r37.31197ce
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='High-speed character set detection library (development version)'
url='https://github.com/kaniini/libguess'
license=('custom')
depends=('glibc')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"

  _ver=$(grep AC_INIT configure.ac | cut -d, -f2 | sed 's/[^0-9.]//g')
  _rev=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.%s" "$_ver" "$_rev" "$_hash"
}

build() {
  cd ${pkgname%-*}

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-*}

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
