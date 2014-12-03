# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gdeskcal
_pkgname=gDeskCal
pkgver=1.01
pkgrel=6
pkgdesc="Little eye-candy calendar for your desktop"
arch=('any')
license=('GPL')
url="http://customize.org/gDeskCal"
depends=('pygtk')
makedepends=('perlxml' 'patch' 'pkg-config')
source=(http://pkgs.fedoraproject.org/repo/pkgs/gdeskcal/$_pkgname-$pkgver.tar.gz/6198d3fb3b28eec6ec430564defda781/$_pkgname-$pkgver.tar.gz
        gdeskcal-utf8.diff)
sha256sums=('cdf480a8252db2bc81098cbe14e9278297a6e14c8dd455a91a8c8d1455d57184'
            '507102c5381f854a6164f3ec0da945f61b312ade0676217dcfe0e29ff2c8d4ff')

prepare() {
  cd "${srcdir}"/$_pkgname-$pkgver

  patch -p1 < ../gdeskcal-utf8.diff
  sed -i 's#python#python2#' $pkgname
}

build() {
  cd "${srcdir}"/$_pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}"/$_pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
