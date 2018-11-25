# Contributor: Erick Pires <rckkas@gmail.com>
# Contributor: Laurent Laffont <laurent.laffont@gmail.com>

pkgname=phratch
pkgver=4.1
pkgrel=1
pkgdesc="Phratch is a programming language that makes it easy to create your own interactive stories, animations, games, music, and art — and share your creations on the web. Port of Scratch on Pharo."
arch=(i686 x86_64)
source=($pkgname-$pkgver.tar.gz)
url="http://www.phratch.com"
license=('MIT')
makedepends=('gendesk')
depends=('pharo-vm')

source=('Phratch.zip::http://phratch.com/download/Phratch4.1-linux.zip' 'phratch.desktop')

md5sums=('aec0d828e291ebbe0a225d5b12576c80' '97c22472ed23597881c547a67c8eee95')

prepare() {
    gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}


package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/share/phratch/
    unzip Phratch.zip -d $pkgdir/usr/share/phratch/

    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/pixmaps/

    chgrp users $pkgdir/usr/share/phratch/Phratch/shared/Pharo4.0.changes
    chmod 775 $pkgdir/usr/share/phratch/Phratch/shared/Pharo4.0.changes

    ln -s /usr/share/phratch/Phratch/phratch $pkgdir/usr/bin/phratch

    cp $pkgdir/usr/share/phratch/Phratch/icons/Pharo.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
