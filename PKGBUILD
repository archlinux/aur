# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=7.7
pkgrel=1
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('i686' 'x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('desktop-file-utils' 'chmlib' 'xdg-utils' 'libzip' 'qtwebkit' 'zip')
makedepends=('patch')
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver-underlinking.patch)
sha256sums=('27cbac45c786b1718550a87e6f86010e161302b426c6396ff2a3091b913b17dd'
            'bb9345a0ecaf70e06cfad06c6c2dbbfca79c3462e1f4bb459e80ecaa31ea58cc')

prepare() {
  cd $pkgname-$pkgver

  patch -Np1 -i "${srcdir}"/$pkgname-$pkgver-underlinking.patch
}

build() {
  cd $pkgname-$pkgver

  qmake-qt4 PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -Dm755 bin/$pkgname "${pkgdir}"/usr/bin/$pkgname
#icon/desktop file
  install -Dm644 packages/$pkgname.png "${pkgdir}"/usr/share/pixmaps/$pkgname.png
  install -Dm644 packages/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
}
