# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Westminboy <westminboy@gmail.com>

pkgname=sylpheed-lite
_pkgname=sylpheed
pkgver=3.4.3
pkgrel=1
pkgdesc="Lightweight in lightweight and user-friendly e-mail client "
arch=('i686' 'x86_64')
url="http://sylpheed.sraoss.jp/en/"
license=('GPL')
depends=('gpgme' 'desktop-file-utils')
makedepends=('openssl')
options=('!libtool')
conflicts=('sylpheed')
install="$pkgname.install"
source=("http://sylpheed.sraoss.jp/$_pkgname/v3.4/$_pkgname-$pkgver.tar.gz"
    "http://sylpheed.sraoss.jp/$_pkgname/v3.4/$_pkgname-$pkgver.tar.gz.asc")
validpgpkeys=('8CF3A5AC417ADE72B0AA4A835024337CC00C2E26') # Hiroyuki Yamamoto
sha256sums=('8602fffa98a01beae95908cb708dc9f31d9caebad17081fe746c97a5ff27e42d'
            'SKIP')


build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr \
    --disable-compface \
    --disable-gtkspell \
    --disable-ipv6 \
    --disable-updatecheck
  make

  # Build Attachment-Tool Plug-in
  cd plugin/attachment_tool && make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Install Attachment-Tool Plug-in
  cd plugin/attachment_tool
  make DESTDIR="$pkgdir/" install-plugin
}
