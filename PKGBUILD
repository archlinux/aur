# Maintainer:

pkgname=leave
pkgver=1.12
pkgrel=5
pkgdesc="Reminds you when you have to leave"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/+source/leave/1.12-2.1"
license=('BSD')
depends=('glibc')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/leave_$pkgver.orig.tar.gz")
sha256sums=('de30529de8abf49004da4120ca352d5c588a657f8845e44d5e83a4860e6bbe1f')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|getprogname()|"leave"|' leave.c
  cut -c 4- leave.c | sed -n '4,29p' > LICENSE
}

build() {
  cd $pkgname-$pkgver
  gcc -o leave leave.c $CFLAGS $CPPFLAGS -D__COPYRIGHT\(x\)= -D__RCSID\(x\)= $LDFLAGS
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 leave "$pkgdir"/usr/bin/leave
  install -Dm644 leave.1 "$pkgdir"/usr/share/man/man1/leave.1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
