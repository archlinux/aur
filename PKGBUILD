# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Ali H. Caliskan <ali.h.caliskan@gmail.com>
# Contributor: Xavier <shiningxc[at]gmail[dot]com>

pkgname=savage2
pkgver=2.1.0.7
pkgrel=1
pkgdesc="Savage 2: A Tortured Soul is an fantasy themed online multiplayer team-based FPS/RTS/RPG hybrid. Completely free as of December 2008."
arch=('i686' 'x86_64')
url='http://savage2.com/'
license=('custom: "Savage 2"')
depends=('mesa' 'libxml2')
makedepends=('unzip')
install=savage2.install
source=("http://savage2.s2games.com/downloads/Savage2-${pkgver}-linux-installer.run" \
'savage2.launcher' 'savage2.desktop' 's2editor.desktop' 's2mviewer.desktop' 'savage2.sh')
md5sums=('a0ac6f3eba8c9a1d7c908489bdb850c9'
         'f08e9499ff5f10b5e5e98454aa595db5'
         'a6957bb87da35d58df86d84a6dca1479'
         'b082a33fd1a580d3c70d80bbbfb0bffe'
         '177155e2c2c4e1382ce9b1343e26b5c7'
         '4acf06412dbd5ebbec89d1c5f2c99b4f')
[ "$CARCH" = "x86_64" ] && source[0]="http://savage2.s2games.com/downloads/Savage2-${pkgver}-linux-x64-installer.run"
[ "$CARCH" = "x86_64" ] && md5sums[0]='ed5cbab367391f91453de21f0f150b04'
PKGEXT='.pkg.tar'

build() {
    cd $srcdir

    # Installer name varies between architectures
    if [ "$CARCH" = "i686" ]; then
        _installer_name=Savage2-${pkgver}-linux-installer.run
    else
        _installer_name=Savage2-${pkgver}-linux-x64-installer.run
    fi

    # Create Destination Directory
    install -d $pkgdir/opt/savage2

    # Make Installer Executable
    chmod +x $srcdir/$_installer_name

    # Run Installer
    $srcdir/$_installer_name --mode unattended --prefix $pkgdir/opt/savage2/

    # Install Game Script missing from 2.1.0.7
    install -D -m 755 $srcdir/savage2.sh \
        $pkgdir/opt/savage2/savage2.sh

    # Install Game Launcher
    install -D -m 755 $srcdir/savage2.launcher \
        $pkgdir/usr/bin/savage2

    # Install Desktop File (Game Client)
    install -D -m 644 $srcdir/savage2.desktop \
        $pkgdir/usr/share/applications/savage2.desktop

    # Install Desktop File (Map Editor)
    install -D -m 644 $srcdir/s2editor.desktop \
        $pkgdir/usr/share/applications/s2editor.desktop

    # Install Desktop File (Model Viewer)
    install -D -m 644 $srcdir/s2mviewer.desktop \
        $pkgdir/usr/share/applications/s2mviewer.desktop

    # Install Icon
    install -D -m 644 $pkgdir/opt/savage2/s2icon.png \
        $pkgdir/usr/share/pixmaps/savage2.png

    # Install License
    install -D -m 644 $pkgdir/opt/savage2/license.txt \
        $pkgdir/usr/share/licenses/$pkgname/license.txt
}
