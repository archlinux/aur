# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Kevin Minehart <kmineh0151@gmail.com>
pkgname=gpmdp-git
_gitname=Google-Play-Music-Desktop-Player-UNOFFICIAL-
pkgver=r362.ba5539f
pkgrel=1
pkgdesc="An electron wrapper for Google Play Music"
arch=('x86_64')
url="https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("$pkgname")
conflicts=("$pkgname" 'gpmdp')
source=($gitname::'git+https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-.git#branch=master')
md5sums=('SKIP')
pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_gitname"
    npm install
}

build() {
    cd "$srcdir/$_gitname"
    npm run package:linux
}

package() {
    cd "$srcdir/$_gitname/dist/"
    mkdir -p $pkgdir/usr/share/ $pkgdir/usr/bin
    mv 'Google Play Music Desktop Player-linux-x64' $pkgdir/usr/share/google-play-music-desktop-player
    ln -sf '/usr/share/google-play-music-desktop-player/Google Play Music Desktop Player' $pkgdir/usr/bin/google-play-music-desktop-player
}

