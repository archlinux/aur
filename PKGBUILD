# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=8.0
pkgrel=1
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('chmlib' 'libzip' 'qt5-webkit' 'qt5-webengine')
changelog=$pkgname.changelog
source=($pkgname-$pkgver.tar.gz::https://github.com/gyunaev/$pkgname/archive/refs/tags/RELEASE_8_0.tar.gz
       fix-8.0-build.patch::https://github.com/gyunaev/$pkgname/commit/e3b09edbbae17ad19661a7514afe5a9d84ca0ffa.patch)
sha256sums=('0eec144b2c09c8b6be98b795f84767098c893bdad7b5a3d11fc5faafead5f9b2'
            '9a3022ce78ab97b6816f80b04557dc25c5dde868e6d89a2a2435ce51417b4f2c')

prepare() {
  cd $pkgname-RELEASE_8_0

#https://github.com/gyunaev/kchmviewer/issues/9
  patch -Np1 -i "${srcdir}"/fix-8.0-build.patch
}

build() {
  cd $pkgname-RELEASE_8_0

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd $pkgname-RELEASE_8_0

  make DESTDIR="${pkgdir}" install

  install -Dm755 bin/$pkgname "${pkgdir}"/usr/bin/$pkgname
#icon/desktop file
  install -Dm644 packages/$pkgname.png "${pkgdir}"/usr/share/pixmaps/$pkgname.png
  install -Dm644 packages/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
}
