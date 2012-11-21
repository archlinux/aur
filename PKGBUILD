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
conflicts=('ioquake3' 'ioquake3-svn')
install=quake3.install
source=('quake3.install' 'quake3.desktop' 'quake3.launcher' 'quake3-smp.launcher' 'quake3ded.launcher' \
'http://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/quake3/linux/linuxq3apoint-1.32b-3.x86.run' \
'http://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/quake3/quake3-1.32c.zip')
md5sums=('330f17b7664f8d0ff98ef173bd37fa33'
         '4b3656ccf6b6f6967f53e0977d7e5c0a'
         'b99913defd8c2c8b2f1b9006f5ddeb9f'
         'a394dea42844aabfe188f56415950908'
         '23710b0dc75e238f6858ad04c872fe91'
         'c71fdddccb20e8fc393d846e9c61d685'
         '5e55095e654732063621a2ffa95a2da3')

build() {
    cd $srcdir

    # Create Destination Package Directories
    install -d $pkgdir/opt/quake3/{baseq3,missionpack}

    # Extract Files from Installer
    chmod +x $srcdir/linuxq3apoint-1.32b-3.x86.run
    $srcdir/linuxq3apoint-1.32b-3.x86.run --tar xf

    # Install BaseQ3 pk3 files
    install -m 644 -t $pkgdir/opt/quake3/baseq3/ \
        $srcdir/baseq3/*.pk3

    # Install Missionpack pk3 files
    install -m 644 -t $pkgdir/opt/quake3/missionpack/ \
        $srcdir/missionpack/*.pk3

    # Install PB Files
    chown -R root:root $srcdir/pb
    mv $srcdir/pb $pkgdir/opt/quake3/

    # Install 1.32c Binaries
    install -m 755 -t $pkgdir/opt/quake3/ \
        $srcdir/Quake\ III\ Arena\ 1.32c/linux/{q3ded,quake3-smp.x86,quake3.x86}

    # Install Launcher (Client)
    install -D -m 755 $srcdir/quake3.launcher \
        $pkgdir/usr/bin/quake3

    # Install Launcher (SMP Client)
    install -D -m 755 $srcdir/quake3-smp.launcher \
        $pkgdir/usr/bin/quake3-smp

    # Install Launcher (Server)
    install -D -m 755 $srcdir/quake3ded.launcher \
        $pkgdir/usr/bin/quake3ded

    # Install Desktop File
    install -D -m 644 $srcdir/quake3.desktop \
        $pkgdir/usr/share/applications/quake3.desktop

    # Install Icon File
    install -D -m 644 $srcdir/quake3.xpm \
        $pkgdir/usr/share/pixmaps/quake3.xpm
}

