# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=singularityviewer-alpha
pkgver=1.8.7.6919
pkgrel=1
pkgdesc="An exciting client for Second Life (secondlife) and OpenSim (opensimulator), which combines the look and feel of Viewer 1.23 with the latest and greatest of available technology. (alpha version)"
url="http://www.singularityviewer.org/"
license=('custom')
arch=('x86_64')
depends=('apr-util' 'gtk2' 'libgl' 'libidn' 'mesa' 'sdl' 'glu' 'pangox-compat' 'gconf' 'libxss' 'libxrandr' 'libxcomposite' 'libgl' 'lib32-zlib' 'libcups' 'atk' 'lib32-util-linux' 'lib32-libidn' 'libxcursor' 'libxtst')
optdepends=(
	'libpulse: for PulseAudio support'
	'alsa-lib: for ALSA support'
	'lib32-alsa-lib: for ALSA support'
	'nvidia-utils: for NVIDIA support' 
	'flashplugin: for inworld Flash support' 
	'gstreamer0.10: for video support, may need good, bad and ugly plugins'
	'lib32-freealut: for OpenAL support'
	'openal')

conflicts=("singularityviewer")
provides=("singularityviewer")

source=("http://sourceforge.net/projects/singularityview/files/alphas/SingularityAlpha-x86_64-$pkgver.tar.bz2"
	"singularityviewer.desktop"
	"singularityviewer.launcher")
md5sums=('e14039660e04e6908ae3f03aa19d92e2'
         'ff7aa34dcd7548e3acdb3c2d44ae6604'
         'eb596f5cf7b6f2d0c55c0082fb99a905')
package() {
cd $srcdir
  
# Rename Data Directory
mv SingularityAlpha-$CARCH-${pkgver} singularityviewer
  
# Install Desktop File
install -D -m644 $srcdir/singularityviewer.desktop \
  $pkgdir/usr/share/applications/singularityviewer.desktop
  
# Install Icon File
install -D -m644 $srcdir/singularityviewer/viewer_icon.png \
  $pkgdir/usr/share/pixmaps/singularityviewer_icon.png
  
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

    
}
