# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=coolvlviewer
pkgver=1.26.14.0
pkgrel=1
pkgdesc="A third-party viewer for Second Life (C) (secondlife) and OpenSim (opensimulator) grids. ('VL' stands for virtual life, formerly known as 'Cool SL Viewer'; native 32bit, binary)"
url="http://sldev.free.fr"
license=('custom')
[ "$CARCH" = "i686"   ] && depends=('apr-util' 'glib2' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat')
[ "$CARCH" = "i686"   ] && optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support' 'nvidia-utils: for NVIDIA support' 'flashplugin: for inworld Flash support' 'gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')
[ "$CARCH" = "x86_64" ] && depends=('apr-util' 'lib32-glib2' 'lib32-libgl' 'lib32-libidn' 'lib32-libjpeg-turbo' 'lib32-mesa' 'lib32-nss' 'lib32-sdl' 'lib32-glu' 'lib32-pangox-compat')
[ "$CARCH" = "x86_64"   ] && optdepends=('lib32-libpulse: for PulseAudio support' 'lib32-alsa-lib: for ALSA support' 'lib32-nvidia-utils: for NVIDIA support' 'lib32-flashplugin: for inworld Flash support' 'lib32-gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')
arch=('i686' 'x86_64')
conflicts=('coolvlviewer-legacy' 'coolvlviewer-experimental')
install=coolvlviewer.install
source=("http://sldev.free.fr/binaries/CoolVLViewer-${pkgver}-Linux-x86-Setup"

        "coolvlviewer.desktop"
        "coolvlviewer.launcher")
md5sums=('9318adc6fd818c49053ad271d6701046'
         '6034374de4a12da2b7566a82097b332f'
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
