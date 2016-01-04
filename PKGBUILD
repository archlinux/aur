# Maintainer: fenuks

pkgname=gwc
_ver=0.21
_release=19
pkgver=${_ver}_${_release}
pkgrel=1
pkgdesc="Gnome Wave Cleaner is a digital audio editor to denoise, dehiss and amplify audio files"
arch=("i686" "x86_64")
url="http://gwc.sourceforge.net/"
license=("GPL")
depends=("libgnomeui" "libsndfile" "fftw")
makedepends=("make")
provides=("$pkgname")
conflicts=("$pkgname")
# install=$pkgname.install
source=("http://downloads.sourceforge.net/project/gwc/gwc2/$_ver-$_release/gwc-$_ver-$_release.tgz"
        "${pkgname}.desktop"
)

md5sums=('740f16be30b178b155b54811491a0b46'
         'c30a0a18981a3897a6d63f6f490b0d6c')

prepare() {
    cd "$srcdir/$pkgname-$_ver-$_release"
    # mkdir -p build & cd build
    ./configure --prefix=/usr
    sed -i 's|DOCDIR = $(DATADIR)/doc/gwc|DOCDIR = ${prefix}/share/doc/gwc|' Makefile
}

build() {
    cd "$srcdir/$pkgname-$_ver-$_release"
    make
}

package() {
    cd "$srcdir/$pkgname-$_ver-$_release"
    # cd build
    # make DESTDIR="$pkgdir/" install
    install -Dm 755 gwc $pkgdir/usr/bin/gwc
    install -Dm 644 gwc-logo.png $pkgdir/usr/share/pixmaps/gwc.png
    install -Dm 644 gwc.desktop $pkgdir/usr/share/applications/gwc.desktop
    install -dm 644 $pkgdir/usr/share/doc/gwc
    for file in gwc_qs.html gwc.html; do install -D doc/C/$file $pkgdir/usr/share/doc/gwc/$file; done
}
