# Maintainer José Cleiton <jcleitonbc@gmail.com>

pkgname=ugene-full-bin
pkgver=33.0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite (binary release)"
arch=('x86_64')
url="http://ugene.net"
license=('GPL')
depends=('qt5-script' 'qt5-svg' 'qt5-webkit' 'qt5-websockets' 'glu' 'procps-ng' 'python')
provides=('ugene')
conflicts=('ugene')
source=("http://ugene.net/downloads/packages/$pkgver/ugene-$pkgver-x86-64-full.tar.gz")
sha256sums=('5761efad5b3951970295e9ef2e57b86658ca0c6f2603512a275abe5d78327d11')

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
