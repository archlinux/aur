# Contributor: MyMaud <russ@russgibson.org>
# Contributor: skydrome <skydrome@i2pmail.org>
# Maintainer: Mike Pento <mpento darkforge net>

pkgname=pan-git
_gitname=pan
pkgver=v0.150.r0.g4c6043e
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
source=("git+https://gitlab.gnome.org/GNOME/$_gitname.git")
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
