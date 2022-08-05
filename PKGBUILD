# Maintainer: Firas Zaidan <firas@zaidan.de>

pkgname=ftp-upload
pkgver=1.6
pkgrel=1
pkgdesc="put files with FTP from a script"
arch=('any')
url="http://www.argon.org/~roderick/"
license=('GPL')
depends=('perl')
makedepends=('gzip')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/f/ftp-upload/ftp-upload_$pkgver.orig.tar.gz)
sha512sums=('ada180b3e61033c2136a24133887cfe219d3e88621b2ac13001539d6350ea92e4b069f5d4756d7d7c44018b91d290db5c8117dfab91dffc01298bd51419a1706')

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
