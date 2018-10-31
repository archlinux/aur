# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=libbass
pkgver=2.4.13.8
pkgrel=3
pkgdesc="BASS audio library"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib unzip)

source=("$pkgname-$pkgver.zip::http://dl.un4seen.com/files/bass24-linux.zip"
        LICENSE)
sha256sums=('3bab61aa062eeab72de0891ce5c0063203464b21d2403e627f565571fa5ee0f1'
            'f7bc36320110c8fd2f87c6d2bb5df6d2231ca9ab31a299b1565de63f7681cc83')

source_armv6h=("$pkgname-$pkgver-$CARCH.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
sha256sums_armv6h=('72451c439d8db4ef2a0b935d7c19ce87ea8787e3a4559ee60ca3c1e96e4112e9')
source_armv7h=("$pkgname-$pkgver-$CARCH.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
sha256sums_armv7h=('72451c439d8db4ef2a0b935d7c19ce87ea8787e3a4559ee60ca3c1e96e4112e9')
source_aarch64=("$pkgname-$pkgver-$CARCH.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
sha256sums_aarch64=('72451c439d8db4ef2a0b935d7c19ce87ea8787e3a4559ee60ca3c1e96e4112e9')

build () {
    unzip -q "$pkgname-$pkgver.zip" -d "$srcdir/$pkgname-$pkgver"

    if [[ -e "$pkgname-$pkgver-$CARCH.zip" ]]; then
        unzip -q "$pkgname-$pkgver-$CARCH.zip" -d "$srcdir/$pkgname-$pkgver/$CARCH"
    fi
}

package () {
    install -D -m644 "$startdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    cd "$srcdir/$pkgname-$pkgver"
    
    case "$CARCH" in
    i686)
        install -D -m755 libbass.so "$pkgdir/usr/lib/libbass.so"
	;;
    x86_64)
        install -D -m755 x64/libbass.so "$pkgdir/usr/lib/libbass.so"
	;;
    armv6h|armv7h)
        install -D -m755 $CARCH/hardfp/libbass.so "$pkgdir/usr/lib/libbass.so"
	;;
    aarch64)
        install -D -m755 $CARCH/aarch64/libbass.so "$pkgdir/usr/lib/libbass.so"
	;;
    esac

    install -D -m644 bass.h "$pkgdir/usr/include/bass.h"
    install -D -m644 bass.chm "$pkgdir/usr/share/doc/libbass/bass.chm"
}
