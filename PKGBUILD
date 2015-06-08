# Contributor: MyMaud <russ@russgibson.org>
# Contributor: skydrome <skydrome@i2pmail.org>
# Maintainer: Frederic Bezies <mymaud@gmail.com>


#_USE_GTK3=n

#if [[ "$_USE_GTK3" = y ]]; then
#    depends=('gtk3' 'gtkspell3')
#    _gtk3="--with-gtk3"
#else
#    depends=('gtk2' 'gtkspell')
#fi

pkgname=pan-git
_gitname=pan2
pkgver=139.166.gaf87825
pkgrel=1
pkgdesc="Pan is a Usenet newsreader that's good at both text and binaries. Development version."
url="http://pan.rebelbase.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gmime' 'gnutls' 'enchant' 'gtk3' 'gtkspell3')
makedepends=('git' 'intltool' 'gnome-common')
conflicts=('pan')
provides=('pan')
install=pan.install
source=("git://git.gnome.org/$_gitname")
md5sums=SKIP

pkgver() {
    cd "$srcdir/$_gitname"
    git describe |sed 's/PAN_0_//;s/-/./g'
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
