# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Westminboy <westminboy@gmail.com>

pkgname=sylpheed-lite
_pkgname=sylpheed
pkgver=3.4.2
pkgrel=2
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
sha256sums=('a4c47b570a5b565d14ff9933cf2e03fcb895034c1f072f9cd2c4a9867a2f2263'
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
