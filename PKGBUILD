# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: MyMaud <russ@russgibson.org>
# Contributor: skydrome <skydrome@i2pmail.org>
# Contributor: Mike Pento <mpento darkforge net>

pkgname=pan-git
_gitname=pan
pkgver=v0.164.r0.gf8e650a6
pkgrel=1
epoch=1
pkgdesc="Pan is a Usenet newsreader that's good at both text and binaries. Development version."
url="http://pan.rebelbase.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gmime3' 'gtkspell3' 'gspell')
makedepends=('git' 'intltool' 'cmake')
conflicts=('pan')
provides=('pan')
source=("git+https://gitlab.gnome.org/GNOME/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/PAN_//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/_/./g'
}

build() {
    cd "$srcdir/$_gitname"

    mkdir build
    cmake -B build
    cmake --build build
}

package() {
    cd "$srcdir/$_gitname"
    cmake --install build $DESTDIR --prefix "$pkgdir/usr"
}
