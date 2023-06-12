# Maintainer: Frank Vanderham <twelve dot eighty at gmail dot com>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname=gftp
pkgver=2.9.1b
pkgrel=5
pkgdesc="A multithreaded ftp client for X Windows"
arch=('x86_64')
url="https://www.gftp.org/"
license=('MIT')
depends=('gtk2' 'openssl' 'readline')
makedepends=('intltool')
source=("gftp-$pkgver.tgz::https://github.com/masneyb/gftp/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fb134d5479a6b81251b9d37be7264fb8be6edb07bce98569e0e0ba9570587fd6')

prepare() {
   cd "$pkgname-$pkgver"
   # openssl 1.1 compatibility
   #sed -e 's|SSL_library_init|SSL_CTX_new|g' -i configure
}

build() {
   cd "$srcdir/$pkgname-$pkgver"
   ./autogen.sh
   ./configure --prefix=/usr --mandir=/usr/share/man #--enable-gtk3
   make
}

package() {
   cd "$srcdir/$pkgname-$pkgver"
   make DESTDIR="$pkgdir" install
   install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

