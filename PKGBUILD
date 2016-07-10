# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=coolvlviewer
pkgver=1.26.18.14
pkgrel=1
pkgdesc="A third-party viewer for Second Life (C) (secondlife) and OpenSim (opensimulator) grids. ('VL' stands for virtual life, formerly known as 'Cool SL Viewer'; native 32bit, binary)"
url="http://sldev.free.fr"
license=('custom')
depends_i686=('apr-util' 'glib2>=2.32' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat')
optdepends_i686=(
	'libpulse: for PulseAudio support'
	'alsa-lib: for ALSA support'
	'nvidia-utils: for NVIDIA support'
	'chromium-pepper-flash: for inworld Flash support'
	'gst-plugins-good: for video support'
	'gst-plugins-bad: for video support'
	'gst-plugins-ugly: for video support'
	'lib32-freealut: for OpenAL support')

depends_x86_64=('apr-util' 'lib32-glib2>=2.32' 'lib32-libgl' 'lib32-libidn' 'lib32-libjpeg-turbo' 'lib32-mesa' 'lib32-nss' 'lib32-sdl' 'lib32-glu' 'lib32-pangox-compat')
optdepends_x86_64=(
	'lib32-libpulse: for PulseAudio support'
	'lib32-alsa-lib: for ALSA support'
	'lib32-nvidia-utils: for NVIDIA support'
	'lib32-gst-plugins-good: for video support'
	'lib32-gst-plugins-bad: for video support'
	'lib32-gst-plugins-ugly: for video support'
	'lib32-freealut: for OpenAL support')

arch=('i686' 'x86_64')
conflicts=('coolvlviewer-legacy' 'coolvlviewer-experimental')
install=coolvlviewer.install
source=("http://sldev.free.fr/binaries/CoolVLViewer-${pkgver}-Linux-x86-Setup"

        "coolvlviewer.desktop"
        "coolvlviewer.launcher")
md5sums=('f7c1ca5c2927494c56bfd05dd15934f5'
         '88b0bca907149f4c26389449081a13fd'
         'fd78de1f6c1333a5120ece89873515e0')

build() {
cd $srcdir
# Run the installer
chmod +x CoolVLViewer-${pkgver}-Linux-x86-Setup
./CoolVLViewer-${pkgver}-Linux-x86-Setup --mode silent --destination $srcdir/coolvlviewer/

}

package(){
# Install Desktop File
install -D -m644 $srcdir/coolvlviewer.desktop \
	$pkgdir/usr/share/applications/coolvlviewer.desktop
 
# Install Icon File
install -D -m755 $srcdir/coolvlviewer/cvlv_icon.png \
	$pkgdir/usr/share/pixmaps/clvl_icon.png

# Install Launcher
install -D -m755 $srcdir/../coolvlviewer.launcher \
	$pkgdir/usr/bin/coolvlviewer
    
# Install License
install -D -m644 $srcdir/coolvlviewer/licenses.txt \
	$pkgdir/usr/share/licenses/$pkgname/LISENSE
    
# Move Data to Destination Directory
install -d $pkgdir/opt/
mv coolvlviewer/ $pkgdir/opt/
    
# Change Permissions of files to root:games
chown -R root:games $pkgdir/opt/coolvlviewer
chmod -R g+rw $pkgdir/opt/coolvlviewer

# Make Binary Group-Executable
chmod g+x $pkgdir/opt/coolvlviewer/cool_vl_viewer
    
}
