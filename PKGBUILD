# Maintainer: Ferdinand "yrlf" Bachmann <theferdi265@gmail.com>
pkgname=libbass_fx
pkgver=2.4.12.6
pkgrel=3
pkgdesc="BASS audio library - Effects Add-On"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib unzip libbass)

source=(
    https://www.un4seen.com/files/z/0/bass_fx24-linux.zip
    LICENSE
)
sha256sums=('1ee97610bc2768357c4c344c0d7a058ac95edf51804c391fdcf7644762bd413b'
            'f7bc36320110c8fd2f87c6d2bb5df6d2231ca9ab31a299b1565de63f7681cc83')
sha256sums_armv6h=('84968a3d6afafaa13d7a4e3b6a4d9e787c49067471118f7d084d13caadb551f5')
sha256sums_armv7h=('84968a3d6afafaa13d7a4e3b6a4d9e787c49067471118f7d084d13caadb551f5')
sha256sums_aarch64=('84968a3d6afafaa13d7a4e3b6a4d9e787c49067471118f7d084d13caadb551f5')

source_armv6h=(bass_fx24-linux-armv6h.zip::https://www.un4seen.com/files/z/0/bass_fx24-linux-arm.zip)
source_armv7h=(bass_fx24-linux-armv7h.zip::https://www.un4seen.com/files/z/0/bass_fx24-linux-arm.zip)
source_aarch64=(bass_fx24-linux-aarch64.zip::https://www.un4seen.com/files/z/0/bass_fx24-linux-arm.zip)

build () {
    unzip -q bass_fx24-linux.zip -d "$srcdir/$pkgname-$pkgver"

    if [[ -e "bass_fx24-linux-$CARCH.zip" ]]; then
        unzip -q bass_fx24-linux-$CARCH.zip -d "$srcdir/$pkgname-$pkgver/$CARCH"
    fi
}

package () {
    install -D -m644 "$startdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    cd "$srcdir/$pkgname-$pkgver"
    
    case "$CARCH" in
    i686)
        install -D -m755 libs/x86/libbass_fx.so "$pkgdir/usr/lib/libbass_fx.so"
    ;;
    x86_64)
        install -D -m755 libs/x86_64/libbass_fx.so "$pkgdir/usr/lib/libbass_fx.so"
    ;;
    armv6h|armv7h)
        install -D -m755 $CARCH/hardfp/libbass_fx.so "$pkgdir/usr/lib/libbass_fx.so"
    ;;
    aarch64)
        install -D -m755 $CARCH/aarch64/libbass_fx.so "$pkgdir/usr/lib/libbass_fx.so"
    ;;
    esac
    
    install -D -m644 bass_fx.chm "$pkgdir/usr/share/doc/libbass/bass_fx.chm"
    install -D -m644 C/bass_fx.h "$pkgdir/usr/include/bass_fx.h"
}
