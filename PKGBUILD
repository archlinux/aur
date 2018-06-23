# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Eragon <sam.vzh@gmail.com>

pkgname=libtranslate
pkgver=0.99
pkgrel=3
pkgdesc="A natural language translation library"
arch=('x86_64')
url="http://www.nongnu.org/libtranslate/"
license=('BSD')
depends=('talkfilters' 'glib2')
makedepends=('intltool' 'libxml2') #libsoup
options=(!emptydirs)
source=("http://savannah.nongnu.org/download/$pkgname/$pkgname-$pkgver.tar.gz"
        'libtranslate-0.99-charsetparse.diff'
        'libtranslate-0.99-condfix.diff'
        'libtranslate-0.99-int64.diff'
        'libtranslate-0.99-libsoup24.diff'
        'libtranslate-0.99-postmarker.diff'
        'libtranslate-0.99-services.diff')
sha256sums=('4b2becb139e51663022d9531c430ebcc81d8b26edc73f6ddc05707ff9950eb34'
            '5b34c339b6c96a4b644d5ebf74ad648413b93f736ed99443b0ec3268e2b4ec27'
            '9470ae97322c5f44b0062c8be3a7a3bb709d98a8a0e01d6d6955851a94506137'
            'ff66a9a617cb54e1d53103e62695bafc1fcced826f2d49b5e3a337a4827be3e0'
            '6ece1007d1bb302e6ce041e6847f7fec9e4208a607cfabe6f6f54210e6d13d51'
            'ba3439f5ea952e8f2c24b00df215e18f6177cd99da99ffce10f62a9b29e09664'
            '2777704812ca0c51900a2f50c3e8987cd3124d1712c3450c74b2f1452b67c4a9')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i "$srcdir/libtranslate-0.99-charsetparse.diff"
  patch -p0 -i "$srcdir/libtranslate-0.99-condfix.diff"
  patch -p0 -i "$srcdir/libtranslate-0.99-int64.diff"
  patch -p1 -i "$srcdir/libtranslate-0.99-libsoup24.diff"
  patch -p1 -i "$srcdir/libtranslate-0.99-postmarker.diff"
  patch -p1 -i "$srcdir/libtranslate-0.99-services.diff"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share --enable-talkfilters \
              --disable-generic # disables libsoup; breaks compilation
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
