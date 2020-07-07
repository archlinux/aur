# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=7.7
pkgrel=5
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('chmlib' 'libzip' 'qt5-webkit')
changelog=$pkgname.changelog
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver-underlinking.patch
        fix-qt5-build.patch)
sha256sums=('27cbac45c786b1718550a87e6f86010e161302b426c6396ff2a3091b913b17dd'
            'bb9345a0ecaf70e06cfad06c6c2dbbfca79c3462e1f4bb459e80ecaa31ea58cc'
            '7d070f4eaa79fa2fd8c4a06807b4792807056e9c248d55e98169d01066248f3d')

prepare() {
  cd $pkgname-$pkgver

  patch -Np1 -i "${srcdir}"/$pkgname-$pkgver-underlinking.patch
  patch -Np1 -i "${srcdir}"/fix-qt5-build.patch
}

build() {
  cd $pkgname-$pkgver

  qmake-qt5 PREFIX=/usr
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
