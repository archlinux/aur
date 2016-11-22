# Maintainer: Justin dray <justin@dray.be>
pkgname=encryptr
pkgver=2.0.0
pkgrel=3
pkgdesc="A zero-knowledge, cloud-based e-wallet / password manager powered by Crypton."
url="https://encryptr.org/"
arch=('i686' 'x86_64')
license=('custom')
depends=('gconf')
makedepends=()
optdepents=()
backup=()
#install=${pkgname}.install
source_x86_64=("https://spideroak.com/dist/encryptr/signed/linux/targz/encryptr-${pkgver}_amd.tar.gz")
source_i686=("https://spideroak.com/dist/encryptr/signed/linux/targz/encryptr-${pkgver}_i386.tar.gz")
source=("${pkgname}.sh"
	"${pkgname}.desktop"
	"32x32.png"
	"64x64.png"
	"128x128.png"
	"256x256.png")
sha256sums=('c2497c8aa3379554d88ab3a478fb467c604a828dd4e4fa95d85e3145865618c0'
            '9ceb57496a45727653cd15121bae7aeba1661904a153e51c3d314e64715a68c8'
            '81b73f274a59e704233284053c14d956314fde2b9937cf8264a6dab049ace7fb'
            'f0979d8367759cb1aa0c727096f3312c4b4ce614bc31c133dd018838b559c73a'
            '8c87d22a2b52854c189f445757c1b959ccab571e318e30f38584035341247ee6'
            'e68796ec9378935285c2714b33ab0a0b28c1a741d2d6006419dfdd904382a9af')
sha256sums_i686=('95094f300a3ffd812c63403692dc183156431adad0491d70119bcab0d283490a')
sha256sums_x86_64=('028ff2844ee3c03f900813f24a928a040a588fab091b682f3428abf38e216fc8')
options=('!strip')
PKGEXT=.pkg.tar

package() {
	install -dm 755 "$pkgdir/usr/lib/$pkgname"
	cd "$pkgdir/usr/lib/$pkgname"

	install -Dm 755 "$srcdir/Encryptr/encryptr-bin" ./encryptr-bin
	install -Dm 644 "$srcdir/Encryptr/icudtl.dat" ./icudtl.dat
	install -Dm 644 "$srcdir/Encryptr/libffmpegsumo.so" ./libffmpegsumo.so
	install -Dm 644 "$srcdir/Encryptr/nw.pak" ./nw.pak

	for size in 32x32 64x64 128x128 256x256
	do
		install -Dm 644 "$srcdir/${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/encryptr.png"
	done
	install -Dm644 "$srcdir/256x256.png" "$pkgdir/usr/share/pixmaps/encryptr.png"
	ln -s '/usr/lib/libudev.so' "$pkgdir/usr/lib/$pkgname/libudev.so.0"

	install -Dm 755 "$srcdir/encryptr.sh" "$pkgdir/usr/bin/encryptr"
	install -Dm 644 "$srcdir/encryptr.desktop" "$pkgdir/usr/share/applications/encryptr.desktop"
}
