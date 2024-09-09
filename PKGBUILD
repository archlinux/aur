# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Remi Gacogne <rgacogne@archlinux.org>
# Contributor: Vladimir Tsanev <tsachev@gmail.com>

pkgname=hiredict
pkgver=1.3.1
pkgrel=2
pkgdesc='C client library for Redict'
arch=('x86_64')
url="https://codeberg.org/redict/$pkgname"
license=('LGPL-3.0-or-later' 'BSD-3-Clause')
depends=('glibc')
checkdepends=('redict')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  make USE_SSL=yes PREFIX=/usr
}

check() {
  cd $pkgname
  make USE_SSL=yes check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  cp -vr LICENSES/* "$pkgdir"/usr/share/licenses/$pkgname
}
