# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: mikers <mikeonthecomputer@gmail.com>
# Contributor: Splex

pkgname=kokua-opensim
pkgver=4.2.2.41800
_pkgver=4_2_2_41800
_pkgprever=4.2.2
pkgrel=1
pkgdesc="An Open Source third party viewer for Open Simulator (opensim) grids, only."
url="http://www.kokuaviewer.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('apr-util' 'gtk2' 'libgl' 'libidn' 'libjpeg-turbo' 'mesa' 'nss' 'sdl' 'glu' 'pangox-compat')
optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support' 'nvidia-utils: for NVIDIA support' 'pepper-flash: for inworld Flash support' 'gstreamer0.10: for video support, may need good, bad and ugly plugins' 'lib32-freealut: for OpenAL support')
conflicts=('kokua-secondlife')

source=("https://netix.dl.sourceforge.net/project/kokua.team-purple.p/Kokua-OS/Linux64Bit/KokuaOS_RLV_64_${_pkgver}_x86_64.tar.txz"
		"https://www.dropbox.com/s/5p6io8zqc33idwh/kokua_icon.png"
		'kokua-opensim.desktop'
		'kokua-opensim.launcher')
md5sums=('75407ffe38350644138dd36c9930af04'
         '58ffa08dac5f50fb6ffefa79ce369653'
         'a5b15ff4dd93dbfc01ee6d7c799728d0'
         'dd2d31fddb0b67846c1dfd3bfed88859')
         
package() {
cd $srcdir
  
# Rename Data Directory
mv KokuaOS_RLV_64_${_pkgver}_$CARCH kokua-opensim

# Install Desktop File
install -D -m644 $srcdir/kokua-opensim.desktop \
  $pkgdir/usr/share/applications/kokua-opensim.desktop

# Install Icon File
install -D -m644 $srcdir/kokua_icon.png \
  $pkgdir/usr/share/pixmaps/kokua-opensim.png

# Install Launcher
install -D -m755 $srcdir/kokua-opensim.launcher \
  $pkgdir/usr/bin/kokua-opensim

# Move Data to Destination Directory
install -d $pkgdir/opt
mv kokua-opensim $pkgdir/opt/

# Change Permissions of files to root:games
chown -R root:games $pkgdir/opt/kokua-opensim
chmod -R g+rw $pkgdir/opt/kokua-opensim

# Make Binary Group-Executable
chmod g+x $pkgdir/opt/kokua-opensim/kokua

# Do not re-register the application with the desktop system at every launch, saves from locally installed desktop files.
sed -i 's|./etc/refresh_desktop_app_entry.sh|#./etc/refresh_desktop_app_entry.sh|' $pkgdir/opt/kokua-opensim/kokua
   
}
