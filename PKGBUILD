# Maintainer: Joermungand <joermungand at gmail dot com>
# Co-Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=carla-bridges-wine
pkgver=2.0rc4
majorver=1.9.14
minorver=${pkgver//rc4/-RC4}
pkgrel=1
pkgdesc="Carla windows bridges"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
conflicts=('carla-bridges-win32' 'carla-bridges-win64')
provides=('carla-bridges-win')
depends=('wine' 'carla')
if [[ $CARCH == 'i686' ]]; then
	source+=("${pkgname}-${pkgver}.tar.xz::https://github.com/falkTX/Carla/releases/download/v$majorver/Carla_$minorver-linux32.tar.xz")
	md5sums+=('8dd11480171693cfd47b209d25b6cdee')
elif [[ $CARCH == 'x86_64' ]]; then
	source+=("${pkgname}-${pkgver}.tar.xz::https://github.com/falkTX/Carla/releases/download/v$majorver/Carla_$minorver-linux64.tar.xz")
	md5sums+=('242de9ef989dbdebfebb7f28c144449b')
fi

prepare() {
	cd "$srcdir"
	mv Carla* "$pkgname-$pkgver"
}

package() {	
	## Goto Carla LV2 directory
	cd "$srcdir/$pkgname-$pkgver/carla.lv2"
	
	## Enable wine bridge for Standalone
	mkdir -p "$pkgdir/usr/lib/carla/"
	cp *.exe "$pkgdir/usr/lib/carla/"
	cp *.dll "$pkgdir/usr/lib/carla/"
	
	## Enable wine bridge for LV2
	mkdir -p "$pkgdir/usr/lib/lv2/carla.lv2"
	cp *.exe "$pkgdir/usr/lib/lv2/carla.lv2"
	cp *.dll "$pkgdir/usr/lib/lv2/carla.lv2"
	
	## Goto Carla VST directory
	cd "$srcdir/$pkgname-$pkgver/carla.vst"
	
	## Enable wine bridge for VST
	mkdir -p "$pkgdir/usr/lib/lv2/carla.vst"
	cp *.exe "$pkgdir/usr/lib/lv2/carla.vst"
	cp *.dll "$pkgdir/usr/lib/lv2/carla.vst"
}
