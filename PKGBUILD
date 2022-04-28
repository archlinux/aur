# Maintainer:  Badr NASSIRI <badr dot nassiri at gmail dot com>
# Contributor:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: quasi <quasi@aur.archlinux.org>

_name=protracker
pkgname=protracker-git
pkgver=v1.46.r3.gf6f4566
pkgrel=1
epoch=1
pkgdesc="Rewrite of ProTracker v2.3D (Amiga)"
arch=('i686' 'x86_64')
url="https://16-bits.org/pt2.php"
license=("PD")
makedepends=('git')
depends=('sdl2')
conflicts=('protracker-svn')

source=("${_name}::git+https://github.com/8bitbubsy/pt2-clone.git"
	protracker.png
	protracker.desktop
)
md5sums=('SKIP'
         '014452ddc77b8a115bfbcea2286a786c'
         '088df5e07ea1524f0be648c20e706f51')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "$srcdir/$_name"
    sh ./make-linux.sh
}

package(){
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps/
	mv "$srcdir/$_name/release/other/pt2-clone" "$srcdir/$_name/release/other/$_name"
    cp "$srcdir/$_name/release/other/$_name" $pkgdir/usr/bin
    install -Dm644 protracker.png "$pkgdir/usr/share/pixmaps/protracker.png"
    install -Dm644 protracker.desktop "$pkgdir/usr/share/applications/protracker.desktop"
}

