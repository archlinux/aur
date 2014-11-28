# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gdeskcal
_pkgname=gDeskCal
pkgver=1.01
pkgrel=5
pkgdesc="Little eye-candy calendar for your desktop"
arch=(any)
license=('GPL')
url="http://customize.org/gDeskCal"
depends=('pygtk')
makedepends=('perlxml' 'patch' 'pkg-config')
source=(http://dl.fedoraproject.org/pub/fedora/linux/releases/15/Everything/source/SRPMS/$pkgname-$pkgver-7.fc15.src.rpm
        gdeskcal-utf8.diff)
sha256sums=('b2ec8ef9c384fce5aee8de220308e6b80351396ca3e137e851ebd2a25016480f'
            '507102c5381f854a6164f3ec0da945f61b312ade0676217dcfe0e29ff2c8d4ff')

build() {
  cd ${srcdir}
  
  tar xzf $_pkgname-$pkgver.tar.gz
  cd ${srcdir}/$_pkgname-$pkgver
  patch -p1 < ../gdeskcal-utf8.diff
  sed -i 's#python#python2#' $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd ${srcdir}/$_pkgname-$pkgver
  
  make DESTDIR=${pkgdir} install
}
