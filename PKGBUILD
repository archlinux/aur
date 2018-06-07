#Maintainer Jens Staal <staal1978@gmail.com>

pkgname=ugene-bin
pkgver=1.30.0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite (binary release)"
arch=('x86_64')
url="http://ugene.net"
license=('GPL')
depends=('qt5-script' 'qt5-svg' 'qt5-webkit' 'glu' 'procps-ng' 'python')
provides=('ugene')
conflicts=('ugene')
source=("http://ugene.unipro.ru/downloads/ugene-$pkgver-x86-64.tar.gz")
sha256sums=('8580197d3a897321e943feb44930d434cb5018ed76e1590b7318d33183d36d8c')

package() {
    cd "$srcdir/ugene-$pkgver"
    
    mkdir -p "${pkgdir}/usr/"{bin,lib/ugene,share/{applications,icons,licenses,man,ugene,mime,pixmaps}}
    
    #move stuff to the correct locations
    mv ugene.desktop $pkgdir/usr/share/applications
    mv LICENSE $pkgdir/usr/share/licenses/ugene
    mv man1 $pkgdir/usr/share/man/man1
    mv application-x-ugene.xml $pkgdir/usr/share/mime/
    mv ugene.png $pkgdir/usr/share/pixmaps/
    tar -xf icons.tar.gz -C $pkgdir/usr/share/icons
    
    mv * $pkgdir/usr/lib/ugene/
    
    cd $pkgdir/usr/bin
    ln -s /usr/lib/ugene/ugene ugene
    
}

