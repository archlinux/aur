# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=gpmd85emulator-git
pkgver=r38.6de05b0
pkgrel=1
pkgdesc="Multiplatform GNU/GPL Tesla PMD 85 Emulator (git version)"
arch=('i686' 'x86_64')
url="https://github.com/mborik/GPMD85Emulator"
license=('GPL')
depends=('gcc-libs' 'sdl')
makedepends=('autoconf' 'automake')
conflicts=('gpmd85emulator')
provides=('gpmd85emulator')
source=("${pkgname}"::'git://github.com/mborik/GPMD85Emulator.git'
	"gpmd85emulator.desktop")
md5sums=('SKIP'
         'b4f4a1ed5508393b306dd3c0a786e86b')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build ()
{
cd $srcdir/$pkgname
aclocal
automake --add-missing
autoconf
./configure --prefix=/usr
make
}

package() {
cd $srcdir/$pkgname
mkdir -p $pkgdir/usr/share/gpmd85emu
make DESTDIR=$pkgdir install
install -D -m644 res/icon.bmp $pkgdir/usr/share/pixmaps/gpmd85emulator.bmp
install -D -m644 $srcdir/gpmd85emulator.desktop ${pkgdir}/usr/share/applications/gpmd85emulator.desktop
}
