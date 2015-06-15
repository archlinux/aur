#Maintainer : Frederic Bezies <fredbezies at gmail dot com>
#Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=tecnoballz
pkgver=0.93.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="An exciting brick breaker game"
url="http://linux.tlk.fr/games/TecnoballZ/"
depends=('sdl_image' 'sdl_mixer' 'tinyxml')
license=('GPL3')
backup=('var/games/tecnoballz/tecnoballz.hi')
source=(http://linux.tlk.fr/games/TecnoballZ/download/${pkgname}-${pkgver}.tgz
	${pkgname}.xpm
	${pkgname}.desktop)
install=tecnoballz.install

md5sums=('7beeacb06fa841382f0ecbe73f64723a'
         '5b8d94612523353b6d2eb32f840b58d8'
         'eec9a3f78b51647b41c3e4c6d1d19ce9')

build() {
                                        
    cd $pkgname-$pkgver
    autoreconf -fvi
    ./configure --prefix=/usr
    ## -O3 breaks compilation!
    sed -i 's/CXXFLAGS=" -O3 -Wall"/CXXFLAGS=" -O2 -Wall"/' configure
    make 
}
package(){
    mkdir -p $pkgdir/usr/share/{applications,pixmaps} 
    install -m644 tecnoballz.xpm $pkgdir/usr/share/pixmaps 
    install -m644 tecnoballz.desktop $pkgdir/usr/share/applications 

    cd $pkgname-$pkgver
    make DESTDIR=$pkgdir install

    ## fix permissions
    chmod -R 775 $pkgdir/var/games/
    chmod 755 $pkgdir/usr/games/$pkgname
    chown root:root $pkgdir/usr/games/$pkgname
}


