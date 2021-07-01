# Maintainer: Alexandros Theodotou <alex@zrythm.org>
_vb=hts_voice_nitech_jp_song070_f001
_vbver=0.90
pkgname=sinsy
pkgver=0.92
pkgrel=1
pkgdesc="An HMM-Based Singing Voice Synthesis System"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.sinsy.jp/"
license=('BSD')
depends=('hts-engine' 'hts-nit-song070-f001')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        a.patch)
md5sums=('fb80f6cb488ea41758e36e57ff28180b'
         '2cb921b1b9d02e8c4d695a69f8617c86')
sha1sums=('8b7576ab04611d8fefba8e5096723be9d19a52a7'
          'c03535de8c2e9d77310cb143066cb6363fda3a7d')

prepare()
{
  cd "$srcdir/$pkgname-$pkgver"
  patch --forward --strip=1 --input="$srcdir/a.patch"
}

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  CXXFLAGS="$CXXFLAGS --std=c++14" ./configure --prefix=/usr \
    --with-hts-engine-header-path=/usr/include \
    --with-hts-engine-library-path=/usr/lib
  make
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix="/usr" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
