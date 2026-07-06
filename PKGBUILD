# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: David Vilar <davvil@gmail.com>
pkgname=vassal
pkgver=3.7.24
pkgrel=1
pkgdesc="Game engine for building and playing online adaptations of board games and card games."
arch=('i686' 'x86_64')
url="http://www.vassalengine.org/"
license=('LGPL')
depends=('java-runtime>=11')
source=(https://github.com/vassalengine/vassal/releases/download/${pkgver}/VASSAL-${pkgver}-linux.tar.bz2
    VASSAL-256x256.png
    vassal.sh
    vassal.desktop)
noextract=()
sha256sums=('67f73ed6848c1bdce125ab1643f1d28d06399f488bb65821552c72ce87175c2e'
            'c0fc12637bb757ef8072e4acb1eac4c15734390beae0cd976541c2831cfab199'
            'a3991dce2ec455222bf722b9c1df66bbfd62b3e1b36099686b1587aac40e7fd8'
            'b0511c43e1b62587e1e23e8216acaf1f04a597d766a3421d90783f342fb98e82')
build() {
    true
}

package() {
    cd "$srcdir/VASSAL-$pkgver"
    destdir=$pkgdir/usr/share/java/$pkgname

    mkdir -p $destdir

    cp -r doc lib $destdir

    mkdir -p $pkgdir/usr/bin
    install -Dm755 ${srcdir}/vassal.sh $pkgdir/usr/bin/vassal
    chmod a+x $pkgdir/usr/bin/vassal

    mkdir -p $destdir/images
    cp $srcdir/VASSAL-256x256.png $destdir/images

    mkdir -p $pkgdir/usr/share/applications

    install -Dm644 ${srcdir}/vassal.desktop $pkgdir/usr/share/applications/vassal.desktop
}

# vim:set ts=2 sw=2 et:
