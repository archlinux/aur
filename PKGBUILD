# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=coolmail
pkgver=1.3
pkgrel=11
pkgdesc="Mail notifier with 3d graphics"
arch=(i686 x86_64)
url="https://packages.debian.org/en/sid/mail/${pkgname}"
license=('GPL2')
depends=('libxt' 'libxau')
source=("http://ftp.us.debian.org/debian/pool/main/c/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
        "http://ftp.us.debian.org/debian/pool/main/c/${pkgname}/${pkgname}_${pkgver}-${pkgrel}.diff.gz")
sha256sums=('2024eda6cfa6d960eb57cad8d961432463f2e9687f9720bdd69e764212fce701'
            'e1c7ff6719f3bf95f55a83ae1ef9579c0efcbfcacb8094c59d56d6302233b132')

prepare() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  patch -p1 -i ../${pkgname}_${pkgver}-${pkgrel}.diff
}

build() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  install -Dm 644 ${pkgname}.man "$pkgdir/usr/share/man/man1/${pkgname}.1"
  gzip "$pkgdir/usr/share/man/man1/${pkgname}.1"
  install -Dm 755 coolmail "$pkgdir/usr/bin/${pkgname}"
}
