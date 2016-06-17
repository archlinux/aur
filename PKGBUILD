# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=singularityviewer32
_pkname=singularityviewer
provides=("singularityviewer")
conflicts=("singularityviewer")
pkgver=1.8.6.6157
pkgrel=1
pkgdesc="A Second Life (secondlife) protocol compatible client application, used to access its service as well as a number of other such as those based upon OpenSim platform"
url="http://www.singularityviewer.org/"
license=('custom')
arch=('i686')
depends=('apr-util' 'gtk2' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat')
optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support' 'nvidia-utils: for NVIDIA support' 'flashplugin: for inworld Flash support' 'gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')
source_i686=("http://bitbucket.org/SingularityViewer/singularityviewer/downloads/Singularity-i686-$pkgver.tar.bz2"
	"singularityviewer.desktop"
	"singularityviewer.launcher")
md5sums_i686=('d2ef47e3a52b92afa0a979dfbe2d9966'
	'21b1e68507a1dd851da8ef7d766afe58'
	'eb596f5cf7b6f2d0c55c0082fb99a905')

package() {
cd $srcdir
  
# Rename Data Directory
mv Singularity-$CARCH-${pkgver} singularityviewer
  
# Install Desktop File
install -D -m644 $srcdir/singularityviewer.desktop \
    $pkgdir/usr/share/applications/singularityviewer.desktop
  
# Install Icon File
install -D -m644 $srcdir/singularityviewer/singularity_icon.png \
    $pkgdir/usr/share/pixmaps/singularityviewer.png
  
# Install Launcher
install -D -m755 $srcdir/singularityviewer.launcher \
    $pkgdir/usr/bin/singularityviewer

# Install License file
install -D -m755 $srcdir/singularityviewer/licenses.txt \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
    
# Move Data to Destination Directory
install -d $pkgdir/opt
mv singularityviewer $pkgdir/opt/
  
# Change Permissions of files to root:games
chown -R root:games $pkgdir/opt/singularityviewer
chmod -R g+rw $pkgdir/opt/singularityviewer

# Make Binary Group-Executable
chmod g+x $pkgdir/opt/singularityviewer/singularity
 
# Do not re-register the application with the desktop system at every launch, saves from locally installed desktop files.
sed -i 's|./refresh_desktop_app_entry.sh|#./refresh_desktop_app_entry.sh|' $pkgdir/opt/singularityviewer/singularity
rm $pkgdir/opt/singularityviewer/refresh_desktop_app_entry.sh
    
}
