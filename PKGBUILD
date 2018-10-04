# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: quasi <quasi@aur.archlinux.org>

pkgname=protracker-svn
pkgver=r139
pkgrel=1
epoch=1
pkgdesc="Rewrite of ProTracker v2.3D (Amiga)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/protracker/"
license=("PD")
makedepends=('subversion')
depends=('sdl2')
source=($pkgname::svn://svn.code.sf.net/p/protracker/code/trunk
	protracker.png
	protracker.desktop
)
md5sums=('SKIP'
         '014452ddc77b8a115bfbcea2286a786c'
         '088df5e07ea1524f0be648c20e706f51')

pkgver() {
    cd "$pkgname"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]}"
}

build(){
    cd "$srcdir/$pkgname"
    sh ./make-linux.sh
}

package(){
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps/
    cp "$srcdir/$pkgname/release/other/protracker" $pkgdir/usr/bin
    install -Dm644 protracker.png "$pkgdir/usr/share/pixmaps/protracker.png"
    install -Dm644 protracker.desktop "$pkgdir/usr/share/applications/protracker.desktop"
}

