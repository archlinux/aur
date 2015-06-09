# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: quasi <quasi@aur.archlinux.org>

pkgname=protracker-svn
pkgver=r996
pkgrel=2
pkgdesc="Rewrite of ProTracker v2.3D (Amiga)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/protracker/"
license=("PD")
makedepends=('subversion')
depends=('sdl' 'mesa')
source=($pkgname::svn://svn.code.sf.net/p/protracker/code/trunk
	protracker.png
	protracker.desktop
)
md5sums=('SKIP'
         '014452ddc77b8a115bfbcea2286a786c'
         '17f38359b386a70f57f127ed841bd2b5')

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
    cp "$srcdir/$pkgname/bin/protracker" $pkgdir/usr/bin
    cp "$srcdir/$pkgname/bin/protracker_opengl" $pkgdir/usr/bin
    install -Dm644 protracker.png "$pkgdir/usr/share/pixmaps/protracker.png"
    install -Dm644 protracker.desktop "$pkgdir/usr/share/applications/protracker.desktop"
}

