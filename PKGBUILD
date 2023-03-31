# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=cpulimit
pkgver=0.2
pkgrel=3
epoch=1
pkgdesc="Limit cpu usage of a process in percentage. Actually sends SIGSTOP/SIGCONT POSIX signals to processes"
arch=('x86_64')
url='https://github.com/opsengine/cpulimit'
license=('GPL')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/opsengine/$pkgname/archive/v$pkgver.tar.gz"
        '0000-fix-includes.patch')
sha256sums=('64312f9ac569ddcadb615593cd002c94b76e93a0d4625d3ce1abb49e08e2c2da'
            'b3255614bf8b190cc8b4b80b287fee955096da801c9897c586fda732ff7c863b')

prepare() {
  patch -d $pkgname-$pkgver -Np1 -i ../0000-fix-includes.patch
  sed -i 's/$(CFLAGS)/$(CFLAGS) $(LDFLAGS)/' $pkgname-$pkgver/*/Makefile
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  install -Dm755 $pkgname-$pkgver/src/cpulimit "$pkgdir/usr/bin/cpulimit"
}
