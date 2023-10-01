# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-filemanager
pkgver=0.8
pkgrel=2
pkgdesc="Cutefish File Manager, simple to use, beautiful, and retain the classic PC interactive design"
arch=('x86_64')
url="https://github.com/cutefishos/filemanager"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kio5' 'solid5')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("https://github.com/cutefishos/filemanager/archive/$pkgver/$pkgname-$pkgver.tar.gz"
         fix-build.patch)
sha512sums=('af3f1caa982c19e14357346d6227034086020977f21b4f06af500d5d92845d142ee530fb151649fd2e7dadbd1837eb13c400968a3b407412baed7044fb60101d'
            'd01169ed902847a30cb6468c153e16876a6c21d795a47a7f530ae503fe79e5a1824214ce08b5ba0451a2c59512677df1e1504f0fd11b44e111ca079789edc667')

prepare() {
  cd filemanager-$pkgver
  patch -p1 -i ../fix-build.patch
}

build() {
  cd filemanager-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
  make translations
}

package() {
  cd filemanager-$pkgver
  make DESTDIR="$pkgdir" install
}
