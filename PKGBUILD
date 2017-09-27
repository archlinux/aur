# Maintainer: Ferdinand "yrlf" Bachmann <theferdi265@gmail.com>
pkgname=libbass_fx
pkgver=2.4.11.1
pkgrel=2
pkgdesc="BASS audio library - Effects Add-On"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib unzip libbass)

source=(https://www.un4seen.com/files/z/0/bass_fx24-linux.zip LICENSE)
sha256sums=(
	'5588e7392425a196a067fe358a082720fdc8a0b398adb884c3760f89105e2c48'
    'f7bc36320110c8fd2f87c6d2bb5df6d2231ca9ab31a299b1565de63f7681cc83'
)

source_armv6h=(bass_fx24-linux-armv6h.zip::https://www.un4seen.com/files/z/0/bass_fx24-linux-arm.zip)
sha256sums_armv6h=('012d8ac3151feca187f38aca0acba312725584760ded60c794c95f7eef552017')
source_armv7h=(bass_fx24-linux-armv7h.zip::https://www.un4seen.com/files/z/0/bass_fx24-linux-arm.zip)
sha256sums_armv7h=('012d8ac3151feca187f38aca0acba312725584760ded60c794c95f7eef552017')

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
        install -D -m755 libbass_fx.so "$pkgdir/usr/lib/libbass_fx.so"
	;;
    x86_64)
        install -D -m755 x64/libbass_fx.so "$pkgdir/usr/lib/libbass_fx.so"
	;;
    armv6h|armv7h)
        install -D -m755 $CARCH/hardfp/libbass_fx.so "$pkgdir/usr/lib/libbass_fx.so"
	;;
    esac
    
    install -D -m644 bass_fx.chm "$pkgdir/usr/share/doc/libbass/bass_fx.chm"
}
