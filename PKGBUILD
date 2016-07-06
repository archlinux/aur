# Maintainer: Michael Straube <michael_straube web de>

pkgname=leave
pkgver=1.12
pkgrel=1
pkgdesc="Reminds you when you have to leave"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/+source/leave/1.12-2.1"
license=('BSD')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz")
sha1sums=('499943d84f0425c4c774563b0d1ae911f565ad1e')

prepare() {
  cd $pkgname-$pkgver

  sed -i 's|getprogname()|"leave"|' leave.c

  # extract license from leave.c
  cut -c 4- leave.c | sed -n '4,29p' > LICENSE
}

build() {
  cd $pkgname-$pkgver

  gcc -o leave leave.c -D__COPYRIGHT\(x\)= -D__RCSID\(x\)=
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 leave "$pkgdir/usr/bin/leave"
  install -Dm644 leave.1 "$pkgdir/usr/share/man/man1/leave.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
