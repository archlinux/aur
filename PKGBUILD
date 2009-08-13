# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3
pkgver=1.32c
pkgrel=2
pkgdesc="The stock Quake 3 Arena binaries. PunkBuster Compatible."
url="http://www.quake3arena.com/"
license=('GPL')
arch=('i686' 'x86_64')
[ "${CARCH}" = "i686"   ] && depends=('libgl' 'libxext')
[ "${CARCH}" = "x86_64" ] && depends=('lib32-libgl' 'lib32-libxext')
makedepends=('unzip')
conflicts=('ioquake3-svn')
install=quake3.install
source=('quake3.install' 'quake3.desktop' 'quake3.launcher' 'quake3-smp.launcher' 'quake3ded.launcher' \
'ftp://ftp.idsoftware.com/idstuff/quake3/linux/linuxq3apoint-1.32b-3.x86.run' \
'ftp://ftp.idsoftware.com/idstuff/quake3/quake3-1.32c.zip')
md5sums=('df46c620394b94dad07bcee2a25aa2ce'
         '4b3656ccf6b6f6967f53e0977d7e5c0a'
         'dbb6faaf7ffdbd4dc3c1fd2639a2923b'
         '413af8ac8dcdcfffb35a10577e7b48ba'
         '8f23bbc33ba5b0e42131f18b6771c4a3'
         'c71fdddccb20e8fc393d846e9c61d685'
         '5e55095e654732063621a2ffa95a2da3')

build() {
	cd $startdir/src

	# Create Destination Package Directories
	install -d $startdir/pkg/opt/quake3/{baseq3,missionpack}
	
	# Extract Files from Installer
	chmod +x $startdir/src/linuxq3apoint-1.32b-3.x86.run
	$startdir/src/linuxq3apoint-1.32b-3.x86.run --tar xf

	# Install BaseQ3 pk3 files
	install -m 644 -t $startdir/pkg/opt/quake3/baseq3/ \
		$startdir/src/baseq3/*.pk3

	# Install Missionpack pk3 files
	install -m 644 -t $startdir/pkg/opt/quake3/missionpack/ \
		$startdir/src/missionpack/*.pk3

	# Install PB Files
	chown -R root:root $startdir/src/pb
	mv $startdir/src/pb $startdir/pkg/opt/quake3/

	# Install 1.32c Binaries
	install -m 755 -t $startdir/pkg/opt/quake3/ \
		$startdir/src/Quake\ III\ Arena\ 1.32c/linux/{q3ded,quake3-smp.x86,quake3.x86}

	# Install Launcher (Client)
	install -D -m 755 $startdir/src/quake3.launcher \
		$startdir/pkg/usr/bin/quake3

	# Install Launcher (SMP Client)
	install -D -m 755 $startdir/src/quake3-smp.launcher \
		$startdir/pkg/usr/bin/quake3-smp

	# Install Launcher (Server)
	install -D -m 755 $startdir/src/quake3ded.launcher \
		$startdir/pkg/usr/bin/quake3ded
	
	# Install Desktop File
	install -D -m 644 $startdir/src/quake3.desktop \
		$startdir/pkg/usr/share/applications/quake3.desktop

	# Install Icon File
	install -D -m 644 $startdir/src/quake3.xpm \
		$startdir/pkg/usr/share/pixmaps/quake3.xpm
} 

