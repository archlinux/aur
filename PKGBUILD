# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=qarma-git
_gitname=qarma
pkgver=70
pkgrel=1
pkgdesc="A drop-in replacement clone for zenity, written in Qt4/5, Qt5 build"
arch=('i686' 'x86_64')
url="https://github.com/luebking/qarma"
license=('GPL')
depends=('qt5-base' 'qt5-x11extras')
makedepends=('git')
provides=('qarma' 'zenity')
conflicts=('zenity' 'qarma')
source=("git+https://github.com/luebking/qarma")
md5sums=("SKIP")

pkgver() {
	cd ${_gitname}
    git rev-list --count HEAD
}

build()
{
    cd $srcdir/$_gitname
    qmake-qt5 && make || return 1
}

package()
{
    cd $srcdir/$_gitname
    mkdir -p $pkgdir/usr/bin
    install qarma $pkgdir/usr/bin
    strip $pkgdir/usr/bin/qarma
    ln -s /usr/bin/qarma $pkgdir/usr/bin/qarma-askpass
    ln -s /usr/bin/qarma $pkgdir/usr/bin/zenity
}
