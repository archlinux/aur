# Maintainer: Kian Kasad <kian at kasad.com>

pkgname=isync-config-patched
_pkgname=isync
pkgver=1.3.1
pkgrel=2
pkgdesc="IMAP and MailDir mailbox synchronizer - with xdg-compliant config location"
arch=('x86_64')
url="http://isync.sourceforge.net"
license=('GPL2')
depends=('libsasl' 'zlib')
conflicts=('isync')
provides=('isync')
source=(https://downloads.sourceforge.net/project/isync/isync/$pkgver/$_pkgname-$pkgver.tar.gz
        https://downloads.sourceforge.net/project/isync/isync/$pkgver/$_pkgname-$pkgver.tar.gz.asc
        isync-xdgconfig.diff)
md5sums=('58bc3507ebe930f8fec5997430be85d5'
         'SKIP'
         '18f7a2734975edd3deb984fadadc3b5a')
validpgpkeys=('96DD32BFBF9FAB04B0D95305AA283E0B2F1BB1D1'
              '63BFD037CAD71E8DFF3AEA3AC17714F08D1BDBBA')

prepare() {
    cd $_pkgname-$pkgver

    patch -p1 -i ../isync-xdgconfig.diff
}

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd $_pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

# vim: ts=8 sts=4 sw=4 et
