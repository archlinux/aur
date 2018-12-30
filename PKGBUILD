# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=trinity
pkgver=1.8
pkgrel=1
pkgdesc="A Linux System call fuzz tester"
arch=('i686' 'x86_64')
url="http://codemonkey.org.uk/projects/trinity/"
license=('GPL')
source=(http://codemonkey.org.uk/projects/trinity/$pkgname-$pkgver.tar.xz
        fix_memfd.patch::https://github.com/kernelslacker/trinity/commit/c93bb184ce996c4d77eefbae2ab0bf74f396ec45.patch
        fix_autofs.patch::https://github.com/kernelslacker/trinity/commit/32aff3da79f50a2dd9a944022c1b2837bfe0d1b7.patch
        fix_irda.patch::https://github.com/kernelslacker/trinity/commit/1b2d43cb383cef86a05acb2df046ce5e9b17a7fe.patch)
sha1sums=('61ceb57cd2624ed9fae48cf4b928ad351c0c2e6c'
          '246bb1a5da35ceccb266eb5b395b116a3837c199'
          'cc79be5e42e5bfed2f23670843c2a648cae331c3'
          '1c2e24c4b66745c713e17a73b518ebc80aec4e0a')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../fix_memfd.patch
  patch -p1 < ../fix_autofs.patch
  patch -p1 < ../fix_irda.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr" install
}
