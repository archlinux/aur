# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=swapspace
pkgver=1.10
pkgrel=5
pkgdesc="A dynamic swap manager"
arch=('i686' 'x86_64')
url="http://pqxx.org/development/swapspace"
license=('GPL')
backup=(etc/swapspace.conf)
source=(http://pqxx.org/download/software/swapspace/$pkgname-$pkgver.tar.gz
        Makefile.patch
        swapspace.service)
sha256sums=('37256d6759be5cefbb50afbeba8bb0f159b3488aecd972898fcc6f4d5e6a3573'
            '7f23fee1563ae1730cd89a3e3994a610d032a53c147178b3b0c9d9b62dfd233a'
            'b829b4f4976c715238702da9b5fcebe3cf4f167c761d9a93347610c1d251ba70')
options=(!buildflags)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/Makefile.patch"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/lib/systemd/system"
  install -m644 ../swapspace.service "$pkgdir/usr/lib/systemd/system"
}
