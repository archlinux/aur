# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Former Maintainer: damir <damir@archlinux.org>

pkgname=pmt
pkgver=2009.07.18
_pngmetaver=1.11
_bmp2pngver=1.62
pkgrel=2
pkgdesc="PNG and MNG tools"
arch=('i686' 'x86_64')
url="http://pmt.sourceforge.net/"
#bmp2png: http://cetus.sakura.ne.jp/softlab/b2p-home/
license=('custom')
depends=('libpng')
source=(http://downloads.sourceforge.net/sourceforge/pmt/pngmeta-${_pngmetaver}.tar.gz \
	http://cetus.sakura.ne.jp/softlab/b2p-home/archives/bmp2png-${_bmp2pngver}.tar.gz \
  LICENSE-pngmeta LICENSE-bmp2png \
	pngmeta-1.11-libpng_fixes.diff bmp2png-1.62-libpng_fixes.diff)
md5sums=('5d495f7668f7ccc64a1576c8cfd15506'
         '29562be8cb5300ecf0361904abff54dd'
         '84f94275e10bd5d6b9833b8ce6907e78'
         '689f14faf70cec4940b3106c4c65d610'
         'a9178000d0a29aabf5e041e83149e793'
         'ba86b1e14f75491c04a1b9a7719506df')

build() {

  cd "$srcdir"/pngmeta-${_pngmetaver}
    patch -Np1 < "$srcdir"/pngmeta-1.11-libpng_fixes.diff
    ./configure --prefix=/usr --mandir=/usr/share/man
    make 
    make DESTDIR="$pkgdir" install

  cd "$srcdir"/bmp2png-${_bmp2pngver}
    patch -Np1 < "$srcdir"/bmp2png-1.62-libpng_fixes.diff
    make BINDIR=/usr/bin
    make BINDIR="$pkgdir"/usr/bin install

  install -D -m644 "$srcdir"/LICENSE-pngmeta "$pkgdir"/usr/share/licenses/$pkgname/pngmeta
  install -D -m644 "$srcdir"/LICENSE-bmp2png "$pkgdir"/usr/share/licenses/$pkgname/bmp2png
}
