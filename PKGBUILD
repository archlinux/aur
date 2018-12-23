# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: mikers <mikeonthecomputer@gmail.com>
# Contributor: Splex

pkgname=kokua-secondlife
pkgver=6.0.1.44454
_pkgver=6_0_1_44454
_pkgprever=6.0.1
pkgrel=1
pkgdesc="An Open Source third party viewer for Second Life® (secondlife), only."
url="http://www.kokuaviewer.org"
license=('GPL')
arch=('x86_64')
depends=('apr-util' 'glib2>=2.32' 'libgl' 'libidn' 'mesa' 'sdl' 'glu' 'pangox-compat' 'gconf' 'libxss' 'libxrandr' 'libxcomposite' 'libgl' 'lib32-zlib' 'libcups' 'atk' 'lib32-libsndfile' 'lib32-util-linux' 'lib32-libidn' 'libxcursor' 'libxtst')
optdepends=('libpulse: for PulseAudio support' 'alsa-lib: for ALSA support'
	'nvidia-utils: for NVIDIA support' 'pepper-flash: for inworld Flash support'
	'gstreamer0.10: for video support, may need good, bad and ugly plugins'
	'lib32-freealut: for OpenAL support'
	'lib32-libidn11: for voice support')
conflicts=('kokua-opensim')

source=("https://netcologne.dl.sourceforge.net/project/kokua.team-purple.p/Kokua-SL/Linux64Bit/Kokua_RLV_${_pkgver}_x86_64.tar.bz2"
		"https://www.dropbox.com/s/5p6io8zqc33idwh/kokua_icon.png"
		'kokua-secondlife.desktop'
		'kokua-secondlife.launcher')

sha512sums=('223f79660224884d6c862a29f2f22b2c8a401515854e84d019b9a1e06dc47198aae12b501fb6bf06dc95e4d46fb6db408beff62e1f35955052e00f62cb85e62c'
            '6de979a05e2a88dec411d74ecb693bead629365f64948c0731cbc78c5c5dd32c74e61fdc7bf50575323d7a4fe5c438aad26635bda177a410fe1e2438124c06a3'
            'ece0b25cca729d1dc61439df9abfe724aea02e28c0bf2631de8b3db055db0385f1c26bab02a7aa8d765600cb8f853d7161e4c2632cf5f3875ca753795c9ee847'
            '91e9c2e22c14a1129113407a48ea1323ee358d7d33eb6af9968a09389511812a9ddc2f18f9851dbc055007b17f5af9384946dab0c5c1253c450e82f8fc3ce9a9')

package() {
cd $srcdir
  
# Rename Data Directory
mv "Kokua_RLV_${_pkgver}_$CARCH" kokua-secondlife

# Install Desktop File
install -D -m644 $srcdir/kokua-secondlife.desktop \
  $pkgdir/usr/share/applications/kokua-secondlife.desktop

# Install Icon File
install -D -m644 $srcdir/kokua_icon.png \
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