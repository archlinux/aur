# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=coolvlviewer
pkgver=1.28.2.0
_pkgver=12820
pkgrel=1
pkgdesc="A third-party viewer for Second Life (C) (secondlife) and OpenSim (opensimulator) grids. ('VL' stands for virtual life, formerly known as 'Cool SL Viewer'; built from source)"
url="http://sldev.free.fr"
license=('custom')
depends=('apr-util' 'glib2>=2.32' 'libgl' 'libidn' 'mesa' 'sdl' 'glu' 'pangox-compat' 'gconf' 'libxss' 'libxrandr' 'libxcomposite' 'libgl' 'lib32-zlib' 'libcups' 'atk' 'lib32-util-linux' 'lib32-libsndfile' 'lib32-libidn' 'libxcursor' 'libxtst')
optdepends=(
	'libpulse: for PulseAudio support'
	'alsa-lib: for ALSA support'
	'lib32-alsa-lib: for ALSA support'
	'nvidia-utils: for NVIDIA support'
	'pepper-flash: for inworld Flash support'
	'gst-plugins-good: for video support'
	'gst-plugins-bad: for video support'
	'gst-plugins-ugly: for video support'
	'lib32-freealut: for OpenAL support'
	'lib32-libidn11: for voice support'
	'wine: for SLVoice support')
makedepends=("cmake" "bison" "flex" "python2" "make" "bzip2" "glibc" "libx11" "libgl" "libxrender" "libidn" "libxinerama" "lib32-libxinerama")
arch=('i686' 'x86_64')
conflicts=('coolvlviewer-bin' 'coolvlviewer-experimental' 'coolvlviewer-experimental-bin')
install=coolvlviewer.install
source=("http://sldev.free.fr/sources/CoolVLViewer-src-${_pkgver}.tar.bz2"
        "coolvlviewer.desktop"
        "coolvlviewer.launcher")
md5sums=('2e7422e7ae7775c3a3c34c00c6296144'
         '7a70defd1c6381bab1af7456b14daca4'
         'fd78de1f6c1333a5120ece89873515e0')

build() {

cd $srcdir/linden/indra
./buildlinux.sh
}

package(){
# Install Desktop File
install -D -m644 $srcdir/coolvlviewer.desktop \
	$pkgdir/usr/share/applications/coolvlviewer.desktop
 
# Install Icon File

#$srcdir/linden/indra/viewer-linux-i686-release/newview/CoolVLViewer-i686-$pkgver/

install -D -m755 $srcdir/linden/indra/viewer-linux-i686-release/newview/CoolVLViewer-i686-$pkgver/cvlv_icon.png \
	$pkgdir/usr/share/pixmaps/clvl_icon.png

# Install Launcher
install -D -m755 $srcdir/coolvlviewer.launcher \
	$pkgdir/usr/bin/coolvlviewer
    
# Install License
install -D -m644 $srcdir/linden/indra/viewer-linux-i686-release/newview/CoolVLViewer-i686-$pkgver/licenses.txt \
	$pkgdir/usr/share/licenses/$pkgname/LISENSE
    
# Move Data to Destination Directory
mv $srcdir/linden/indra/viewer-linux-i686-release/newview/CoolVLViewer-i686-$pkgver/ $srcdir/coolvlviewer
install -d $pkgdir/opt/
mv coolvlviewer/ $pkgdir/opt/
    
# Change Permissions of files to root:games
chown -R root:games $pkgdir/opt/coolvlviewer
chmod -R g+rw $pkgdir/opt/coolvlviewer

# Make Binary Group-Executable
chmod g+x $pkgdir/opt/coolvlviewer/cool_vl_viewer
}
