# Maintainer: jerry73204 <jerry73204@gmail.com>
# Previous maintainer: Maxwell Pray a.k.a. Synthead <synthead1@gmail.com>
# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>
# Contributor: SiliciousReese <danieldarnell@protonmail.ch>

pkgname=samdump2
pkgver=3.0.0
pkgrel=4
pkgdesc='Dump password hashes from a Windows NT/2k/XP installation.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/ophcrack/files/samdump2/'
license=('GPL')
depends=('openssl')
source=("http://downloads.sourceforge.net/ophcrack/$pkgname-$pkgver.tar.bz2"
        'openssl_compat.patch')
sha256sums=('602659af30c565750fa01650e0a223d26355b5df98f2fbc30e3a6c593ed4e526'
            '97ed4fdd55d4cf750b334b0b10a8f345a2771a4150c34d1a138b1abe31a933a3')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 < ../openssl_compat.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make LIBS='-lssl -lcrypto' CFLAGS="$CFLAGS"
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/samdump2" "$pkgdir/usr/bin/samdump2"
  install -Dm 644 "$srcdir/$pkgname-$pkgver/samdump2.1" "$pkgdir/usr/share/man/man1/samdump2.1"
}
