# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Ali H. Caliskan <ali.h.caliskan@gmail.com>
# Contributor: Xavier <shiningxc[at]gmail[dot]com>

pkgname=savage2
pkgver=2.1.0.1
pkgrel=1
pkgdesc="Savage 2: A Tortured Soul is an fantasy themed online multiplayer team-based FPS/RTS/RPG hybrid. Completely free as of December 2008."
arch=('i686' 'x86_64')
url='http://savage2.com/'
license=('custom: "Savage 2"')
depends=('curl' 'mesa' 'libjpeg6' 'libpng' 'libxml2' 'speex')
makedepends=('unzip')
install=savage2.install
source=("http://dl.heroesofnewerth.com/Savage2Install-$pkgver-$CARCH.bin" \
'savage2.launcher' 'savage2.desktop' 's2editor.desktop' 's2mviewer.desktop')
md5sums=('1ff815b9e864862d6d2cf6c635278b80'
         'fb03853628775f66689852a4125044e8'
         'a6957bb87da35d58df86d84a6dca1479'
         'b082a33fd1a580d3c70d80bbbfb0bffe'
         '177155e2c2c4e1382ce9b1343e26b5c7')
[ "$CARCH" = "x86_64" ] && md5sums[0]='78a5df8adc008e2c7493bab9f66a3092'

build() {
    cd $srcdir

    # Create Destination Directory
    install -d $pkgdir/opt/savage2

    # Extract Game Data from Installer
    unzip -o $srcdir/Savage2Install-$pkgver-$CARCH.bin 

    # Install Savage 2 Data
    cp -r $srcdir/data/* $pkgdir/opt/savage2 

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
    install -D -m 644 $srcdir/data/s2icon.png \
        $pkgdir/usr/share/pixmaps/savage2.png

    # Install License
    install -D -m 644 $srcdir/data/license.txt \
        $pkgdir/usr/share/licenses/$pkgname/license.txt
}
