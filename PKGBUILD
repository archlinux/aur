# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('amavisd-milter')
pkgver=1.6.1
pkgrel=1
pkgdesc='amavisd-milter is a sendmail milter (mail filter) for amavisd-new and sendmail which uses the new AM.PDP protocol.'
arch=('i686' 'x86_64')
url='http://amavisd-milter.sourceforge.net'
license=('BSD')
depends=('amavisd-new')
makedepends=('libmilter')
source=("https://downloads.sourceforge.net/project/amavisd-milter/amavisd-milter/amavisd-milter-$pkgver/amavisd-milter-$pkgver.tar.gz"
        "amavisd-milter.service")
sha256sums=('d470be72ddef4cf38b93fb4b2f02dfca4f826f95137b56ebf281a7feec6cf282'
            'f3e9cac39d76f78ac95700c69fed812e45724a863abd874c56ed9ff29426e4b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin
    
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm 644 "$srcdir"/amavisd-milter.service "$pkgdir/usr/lib/systemd/system/amavisd-milter.service"
}

