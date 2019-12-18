# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=libbass
pkgver=2.4.15
pkgrel=1
pkgdesc="BASS audio library"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib unzip)

source=("$pkgname-$pkgver.zip::http://dl.un4seen.com/files/bass24-linux.zip"
        LICENSE)
sha256sums=('65a85873f5c6057abe947e17616bd4e0de858ce42bb74f5f9716ea53e1571b25'
            'f7bc36320110c8fd2f87c6d2bb5df6d2231ca9ab31a299b1565de63f7681cc83')

source_armv6h=("$pkgname-$pkgver-arm.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
sha256sums_armv6h=('d59d58b5dbecab4e38848abb355368ea4ea6ed78e9a5a41164d1347bc844aea4')
source_armv7h=("$pkgname-$pkgver-arm.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
sha256sums_armv7h=('d59d58b5dbecab4e38848abb355368ea4ea6ed78e9a5a41164d1347bc844aea4')
source_aarch64=("$pkgname-$pkgver-arm.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip")
sha256sums_aarch64=('d59d58b5dbecab4e38848abb355368ea4ea6ed78e9a5a41164d1347bc844aea4')

build () {
    unzip -q "$pkgname-$pkgver.zip" -d "$srcdir/$pkgname-$pkgver"

    case "$CARCH" in
    armv6h|armv7h|aarch64)
        unzip -q "$pkgname-$pkgver-arm.zip" -d "$srcdir/$pkgname-$pkgver/arm"
        ;;
    esac
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
        install -D -m755 arm/hardfp/libbass.so "$pkgdir/usr/lib/libbass.so"
	;;
    aarch64)
        install -D -m755 arm/aarch64/libbass.so "$pkgdir/usr/lib/libbass.so"
	;;
    esac

    install -D -m644 bass.h "$pkgdir/usr/include/bass.h"
    install -D -m644 bass.chm "$pkgdir/usr/share/doc/libbass/bass.chm"
}
