# Maintainer: robertfoster
# Contributor: OK100 <ok100@lavabit.com>
# Contributor: Jeremy Newton (Mystro256)
# Contributor: Ivan Nikolaev <voidexp@gmail.com>
# Contributor: Christian Ohrfandl (ToxicDragon)

pkgname=guitar-pro
pkgver=11686
pkgrel=5
pkgdesc="A popular tablature editor software for guitar, bass, and many other instruments."
url="http://www.guitar-pro.com"
arch=('i686' 'x86_64')
license=('Proprietary')
depends=('pulseaudio')
depends_x86_64=('lib32-glib2' 'lib32-libpulse' 'lib32-libgl' 'lib32-libxml2' 'lib32-portaudio' 'lib32-zlib'
'lib32-libpng12' 'lib32-libxrender' 'lib32-freetype2' 'lib32-fontconfig')
depends_i686=('glib2' 'libgl' 'libxml2' 'portaudio' 'zlib' 'libxrender' 'freetype2' 'libpng12')
makedepends=('binutils' 'tar')

source=("https://downloads.guitar-pro.com/gp6/gp6-full-linux-r$pkgver.deb"
	"https://github.com/M0Rf30/openssl098-lib32/raw/master/libcrypto.so.0.9.8"
"https://github.com/M0Rf30/openssl098-lib32/raw/master/libssl.so.0.9.8")

build() {
	cd "$srcdir"
	tar xvzf data.tar.gz || return 1
}

package() {
	cd "$srcdir"

	mv -v opt $pkgdir
	mv -v usr $pkgdir

	install -m755 -D libcrypto.so.0.9.8 $pkgdir/opt/GuitarPro6
	install -m755 -D libssl.so.0.9.8 $pkgdir/opt/GuitarPro6
	sed -i 's|Icon=guitarpro6.png|Icon=GP6-icon|g' $pkgdir/usr/share/applications/GuitarPro6.desktop
	mv $pkgdir/usr/share/pixmaps/guitarpro6.png $pkgdir/usr/share/pixmaps/GP6-icon.png
	echo "StartupWMClass=GuitarPro" >> $pkgdir/usr/share/applications/GuitarPro6.desktop
}

md5sums=('3de3b59151b33965a92cd4f51162aeee'
	'3336a9a1296e78cc5645f99dfa42f1e4'
'fa66495bce4ec55def25c49fb188065e')
