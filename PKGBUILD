# Maintainer: Benjamin Bukowski <bbukowski at posteo dot de>
# Contributer: b00rt00s ( bomby dot zrzuc at gmail dot com )

_realname="DirSync Pro"
_pkgname=DirSyncPro
pkgname=dirsyncpro
pkgver=1.51
pkgrel=2
pkgdesc="A small but powerfull utility for file and folder synchronisation"
arch=('i686' 'x86_64')
url="http://www.dirsyncpro.org/"
license=('GPL')
depends=('java-runtime' 'desktop-file-utils')
source=("http://downloads.sourceforge.net/project/directorysync/DirSync%20Pro%20%28stable%29/${pkgver}/${_pkgname}-${pkgver}-Linux.tar.gz"
        "dirsyncpro-home-wd.patch"
        "dirsyncpro.desktop"
        "dirsyncpro.install")
md5sums=('deaaf7ea8a51dff3dbaa25a1558e6b88'
         '08ad637c654d21fb52a86d252ac89865'
         'd72d5899c667e572b54646ad9da0c839'
         '0b6211b511da48346cecdc1d2f963c76')
install="dirsyncpro.install"         

build() {
    cd "$srcdir/$_pkgname-$pkgver-Linux"

    msg "Apply some patches..."
    patch -Np1 -i ../dirsyncpro-home-wd.patch
}

package() {
    cd "$srcdir/$_pkgname-$pkgver-Linux"
    
    mkdir -p $pkgdir/{opt,usr/{bin,share/applications}}
    cp -a "$srcdir/$_pkgname-$pkgver-Linux" $pkgdir/opt/$pkgname || return 1
    chmod +x $pkgdir/opt/$pkgname/$pkgname.sh

    ln -s /opt/$pkgname/$pkgname.sh $pkgdir/usr/bin/$pkgname
    
    install -m644 $srcdir/dirsyncpro.desktop $pkgdir/usr/share/applications
    
    cd $pkgdir/opt/dirsyncpro/
    jar xf dirsyncpro.jar icons/DirSyncPro48x48.png || return 1
}


