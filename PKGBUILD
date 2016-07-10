# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=singularityviewer
pkgver=1.8.7.6888
_pkgver=1_8_7_6888
pkgrel=1
pkgdesc="A Second Life (secondlife) protocol compatible client application, used to access its service as well as a number of other such as those based upon OpenSim platform"
url="http://www.singularityviewer.org/"
license=('custom')
arch=('x86_64')
depends=('apr-util' 'gtk2' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat')
optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support' 'nvidia-utils: for NVIDIA support' 'flashplugin: for inworld Flash support' 'gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')
#source_i686=("http://bitbucket.org/SingularityViewer/singularityviewer/downloads/Singularity-i686-$pkgver.tar.bz2"
#	"singularityviewer.desktop"
#	"singularityviewer.launcher")

#source_x86_64=("http://bitbucket.org/SingularityViewer/singularityviewer/downloads/Singularity-x86_64-$pkgver.tar.bz2"
#	"singularityviewer.desktop"
#	"singularityviewer.launcher")

source_x86_64=("http://67.170.30.149/Singularity_${_pkgver}_$CARCH.tar.xz"
	"singularityviewer.desktop"
	"singularityviewer.launcher"
        "http://dl.dropboxusercontent.com/u/4361965/singularityviewer.png")
md5sums_x86_64=('d7604c7cb594a82c184a528dd9753f8e'
                '3b6c5641f35a099af35ff4065733049f'
                'eb596f5cf7b6f2d0c55c0082fb99a905'
                '0c825fe422dadd0cac9010e7ff152cfa')

package() {
cd $srcdir
  
# Rename Data Directory
mv Singularity_${_pkgver}_$CARCH singularityviewer
  
# Install Desktop File
install -D -m644 $srcdir/singularityviewer.desktop \
    $pkgdir/usr/share/applications/singularityviewer.desktop
  
# Install Icon File
install -D -m644 $srcdir/singularityviewer.png \
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
