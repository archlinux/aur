# Maintainer: Firas Zaidan <firas@zaidan.de>

pkgname=ftp-upload
pkgver=1.5
pkgrel=1
pkgdesc="put files with FTP from a script"
arch=('any')
url="http://www.argon.org/~roderick/"
license=('GPL')
depends=('perl')
makedepends=('gzip')
source=(http://www.argon.org/~roderick/ftp-upload-$pkgver.tar.gz)
sha512sums=('d17fba062f057724a181cf774e500a4a273d6a605db58b467df74bbd48beabe1ca60daac89951336903d958adf3330da7211e3754ac217b372dbed82566199a6')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  perl Makefile.PL
  make
  gzip "${srcdir}/$pkgname-$pkgver/blib/man1/ftp-upload.1p"
  gzip "${srcdir}/$pkgname-$pkgver/debian/changelog"
}

package() {
  install -D -m755 "${srcdir}/$pkgname-$pkgver/blib/script/ftp-upload" "${pkgdir}/usr/bin/ftp-upload"
  install -D -m644 "${srcdir}/$pkgname-$pkgver/debian/changelog.gz" "${pkgdir}/usr/share/ftp-upload/changelog.gz"
  install -D -m644 "${srcdir}/$pkgname-$pkgver/debian/copyright" "${pkgdir}/usr/share/ftp-upload/copyright"
  install -D -m644 "${srcdir}/$pkgname-$pkgver/blib/man1/ftp-upload.1p.gz" "${pkgdir}/usr/share/man/man1/ftp-upload.1p.gz"
}
