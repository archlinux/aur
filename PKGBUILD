# Maintainer: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: Rene Wiermer <rwiermer@googlemail.com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=qtads
pkgver=2.1.7
pkgrel=2
url="http://qtads.sourceforge.net/"
license=('GPL')
pkgdesc="A Qt-based interpreter for TADS text adventures. Support TADS 2 and 3, both for text-only and multimedia adventures."
arch=('i686' 'x86_64')
depends=('qt5-base' 'sdl_sound' 'sdl_mixer')
source=(
	"http://downloads.sourceforge.net/sourceforge/qtads/$pkgname-$pkgver.tar.bz2"
	"02_pointer_integer_comparison.patch::https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=853629;filename=02_pointer_integer_comparison.diff;msg=24"
	"$pkgname.desktop"
)
sha512sums=('ab88aa20991642df6048af49d2cd7b804dbb98b3f5c6ab38ad974e8b39531d880eac0eae0ba773f332e9568578b76b677bc35753f7d1e6d9a99d919b15f4c6ee'
            '84ecff9b5a46daee07402dffc23ef570bcd43b12fd66bf623b0465e41a77bd025390bc6ed5624e840a3b344054dea5da55e515063525bcc62a94a5ab2f4da15a'
            '90daa97576717fa4eb7d81599fcc24fa7fa025e03ab4690a1b4e99f6cd855348c3ba9319a36f51b14bc9180454b15e0f35653912e5f3877bea0694b5e44e415c')


prepare() {
	cd $srcdir/$pkgname-$pkgver
	patch -Np1 -i $srcdir/02_pointer_integer_comparison.patch
}

build() {
	cd $srcdir/$pkgname-$pkgver

	qmake
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	install -D -m755 qtads $pkgdir/usr/bin/qtads
	#desktop icon
	install -D -m644 ${pkgname}_48x48.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -D -m644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
