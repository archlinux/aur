# Contributor: Karol "Kenji Takahashi" Wozniak <wozniakk@gmail.com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=scrollz
_pkgname=ScrollZ
pkgver=2.2.3
pkgrel=5
epoch=
pkgdesc="An advanced IRC client based on ircII client."
arch=('i686' 'x86_64')
url="http://www.scrollz.info/"
license=('custom')
groups=()
depends=('ncurses' 'openssl')
makedepends=()
checkdepends=()
optdepends=()
provides=('scrollz')
conflicts=('scrollz-git')
replaces=()
backup=()
install=
changelog=
source=(http://www.scrollz.info/download/$_pkgname-$pkgver.tar.gz
        makefile.diff)
noextract=()
md5sums=('b99a247b627fb6d482549878e893d185'
         'cc7fc58e616e18f8175ec6225bdc4fa2')
sha1sums=('81acfc32f13369e30878ead9f52c598f62f90abd'
          'bb4743475792db6699fab3069a8ef3497acc49d0')
sha256sums=('7d95d323168d117b6cb6e73fe1de85b863de7c681b5004545b6eceb76c208d03'
            'b2f99fba728da5f806b80691f9e045f086179c3a8216365fdfd928d0fad45032')
options=()

prepare() {
    cd $srcdir/$_pkgname-$pkgver
    patch -p1 -i $srcdir/makefile.diff
}

build() {
    cd $srcdir/$_pkgname-$pkgver
    unset CPPFLAGS
    ./configure --prefix=/usr \
                --enable-regexp \
                --enable-fish \
                --enable-ipv6 \
                --with-openssl \
                --with-default-server='!chat.freenode.net:6697'
    make
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    make DESTDIR="$pkgdir" install
    install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

