# Maintainer: Felix Yan <felixonmars@gmail.com>
 
pkgname=libxtract-git
_gitname=LibXtract
pkgver=0.159.b8c8c2c
pkgrel=1
pkgdesc='A simple, portable, lightweight library of audio feature extraction functions'
url='https://github.com/jamiebullock/LibXtract'
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('libxtract')
conflicts=('libxtract')
source=("git://github.com/jamiebullock/LibXtract.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/$_gitname"
  sh autogen.sh
  ./configure --prefix='/usr' # --enable-pd_example
  make
}
package ()
{
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

