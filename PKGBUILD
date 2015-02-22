# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_svnname='pk2-la'

pkgname=pk2-la-svn
pkgver=16 
pkgrel=4
pkgdesc="Program to use the Microchip PICkit 2 has as a logic analyzer and I/O probe"
arch=('any')
url="http://sourceforge.net/projects/pk2-la/"
license=('GPL2')
depends=('python2' 'python2-pyusb' 'pygtk')
provides=('pk2-la')
conflicts=('pk2-la')
makedepends=('subversion')

source=("$_svnname::svn+http://svn.code.sf.net/p/$_svnname/code")
md5sums=('SKIP')


pkgver() 
{
    cd "$srcdir/$_svnname"
    local ver="$(svnversion)"
    printf "%s" "${ver//[[:alpha:]]}"
}

prepare()
{
    msg "Patching files...."
    sed -i "s/python/python2/g" $srcdir/$_svnname/pk2-la
}

package() 
{
    cd "$srcdir/$_svnname/"
    msg "Creating package..."
    install -Dm755 pk2-la $pkgdir/usr/bin/pk2-la
    install -Dm644 COPYING $pkgdir/usr/share/licenses/pk2-la/COPYING
} 
