# Maintainer : Alois Nespor <alium@artixlinux.org>
# Contributor: echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g
# Contributor: lele85 <emanuele.rampichini@gmail.com>

pkgname=posterazor-qt5
pkgver=1.9.7
pkgrel=1
pkgdesc="PosteRazor cuts a raster image or PDF document into pieces which can be printed and assembled to a poster - QT5 version"
arch=('i686' 'x86_64')
url="https://github.com/aportale/posterazor"
license=('GPL')
depends=('poppler-qt5')
conflicts=('posterazor')
_commit=899d345281cf4a34ffe97d50ea35da784b0ed4a1 #1.9.7
source=("git+https://github.com/aportale/posterazor.git#commit=$_commit" posterazor.desktop posterazor.xpm)

build() {
	cd posterazor/src
	qmake-qt5 QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS" posterazor.pro
	make
}
package() {
	cd posterazor/src
	install -Dm755 PosteRazor $pkgdir/usr/bin/posterazor

	#Install .desktop and icon
	install -Dm644 $srcdir/posterazor.desktop $pkgdir/usr/share/applications/posterazor.desktop
	install -Dm644 $srcdir/posterazor.xpm $pkgdir/usr/share/icons/posterazor.xpm
}
sha256sums=('SKIP'
            'd393b99b5cc9122c3050fdf195e128d654557dbfa24ca911dc138178a18e528d'
            'dd23560b60950add8aec451d127e33f6c5a81824db4ed729bd7fc0f21f9f373d')
