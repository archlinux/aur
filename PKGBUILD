# Contributor: MyMaud <russ@russgibson.org>
# Contributor: skydrome <skydrome@i2pmail.org>
# Maintainer: Frederic Bezies <mymaud@gmail.com>


pkgname=pan-git
_gitname=pan2
pkgver=0.144.r4.g29aad7e
pkgrel=1
epoch=1
pkgdesc="Pan is a Usenet newsreader that's good at both text and binaries. Development version."
url="http://pan.rebelbase.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gmime' 'gtkspell3')
makedepends=('git' 'intltool')
conflicts=('pan')
provides=('pan')
source=("git://git.gnome.org/$_gitname")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/PAN_//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/_/./g'
}

build() {
    cd "$srcdir/$_gitname"

    ./autogen.sh \
        --prefix=/usr \
        --disable-dependency-tracking \
        --with-gmime-crypto \
        --with-gnutls \
        --with-gtkspell \
        --with-gtk3

    make
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir" install
}
