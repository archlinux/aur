# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: mikers <mikeonthecomputer@gmail.com>
# Contributor: Splex


pkgname=kokua-secondlife
pkgver=4.0.2.38137
_pkgver=4_0_2_38137
_pkgprever=4.0.2
pkgrel=1
pkgdesc="An Open Source third party viewer for Second Life® (secondlife), only."
url="http://www.kokuaviewer.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('apr-util' 'gtk2' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat')
optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support' 'nvidia-utils: for NVIDIA support' 'flashplugin: for inworld Flash support' 'gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')
replaces=('kokua-bin')
conflicts=('kokua-bin')

#http://bitbucket.org/kokua/downloads/downloads/Kokua_${_pkgver}_i686.tar.bz2"
source_i686=("http://sourceforge.net/projects/kokua.team-purple.p/files/Kokua-${_pkgprever}/Kokua_${_pkgver}_i686.tar.txz"

             'kokua-secondlife.desktop'
             'kokua-secondlife.launcher')
        
#"http://bitbucket.org/kokua/downloads/downloads/Kokua_64_${_pkgver}_x86_64.tar.bz2"

source_x86_64=("http://sourceforge.net/projects/kokua.team-purple.p/files/Kokua-${_pkgprever}/Kokua_64_${_pkgver}_x86_64.tar.txz"
		'kokua-secondlife.desktop'
		'kokua-secondlife.launcher')
md5sums_i686=('b94695e087119dd1769807144a491938'
              '3893a2c8ae9cb8e2adb4d7c47750029b'
              'e12fd7bd333f4f810dec66f1be17c71c')
md5sums_x86_64=('90e7d4bdca0f939a429f622c84f1f610'
                '3893a2c8ae9cb8e2adb4d7c47750029b'
                'e12fd7bd333f4f810dec66f1be17c71c')


package() {
cd $srcdir
  
# Rename Data Directory
if [ "$CARCH" = "i686" ]; then
mv Kokua_${_pkgver}_$CARCH kokua-secondlife
elif [ "$CARCH" = "x86_64" ]; then
mv Kokua_64_${_pkgver}_$CARCH kokua-secondlife
fi

# Install Desktop File
install -D -m644 $srcdir/kokua-secondlife.desktop \
  $pkgdir/usr/share/applications/kokua-secondlife.desktop

# Install Icon File
install -D -m644 $srcdir/kokua-secondlife/kokua_icon.png \
  $pkgdir/usr/share/pixmaps/kokua-secondlife.png

# Install Launcher
install -D -m755 $srcdir/kokua-secondlife.launcher \
  $pkgdir/usr/bin/kokua-secondlife

# Move Data to Destination Directory
install -d $pkgdir/opt
mv kokua-secondlife $pkgdir/opt/

# Change Permissions of files to root:games
chown -R root:games $pkgdir/opt/kokua-secondlife
chmod -R g+rw $pkgdir/opt/kokua-secondlife

# Make Binary Group-Executable
chmod g+x $pkgdir/opt/kokua-secondlife/kokua

# Do not re-register the application with the desktop system at every launch, saves from locally installed desktop files.
sed -i 's|./etc/refresh_desktop_app_entry.sh|#./etc/refresh_desktop_app_entry.sh|' $pkgdir/opt/kokua-secondlife/kokua
   
}