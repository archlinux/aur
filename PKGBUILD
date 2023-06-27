# Contributor: Daniel YC Lin <dlin (at) gmail.com>

pkgname=bcpp
pkgver=20230130
pkgrel=1
pkgdesc="utility for indents C/C++ source programs"
arch=('i686' 'x86_64')
url="https://invisible-island.net/bcpp/bcpp.html"
license=("custom")
depends=(gcc-libs glibc)
source=(https://invisible-island.net/archives/${pkgname}/${pkgname}-${pkgver}.tgz)
b2sums=('f51ae04ef75125d2040f9ef2ab9fb5513ad83fc6095b85bc091bf109d43b066723743c02f703b90f5d4faeb368da86d611d9ce46237c10e31b861b473de49282')


build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/etc"
  cp code/bcpp.cfg "$pkgdir/etc/"
  mkdir -p "$pkgdir/usr/share/licenses/bcpp"
  install -m644 COPYING "$pkgdir/usr/share/licenses/bcpp/"
}

