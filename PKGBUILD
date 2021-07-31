# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eduardo Sánchez Muñoz

pkgname=dsf2flac-git
pkgver=r29.b0cf5aa
pkgrel=3
pkgdesc="Tool for converting DSF to FLAC files."
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/hank/dsf2flac"
license=(GPL2)
depends=(flac boost-libs taglib id3lib)
makedepends=(git boost cmake)
source=("git+https://github.com/hank/dsf2flac.git"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/dsf2flac-fix-build-with-boost-1.76.patch")
sha256sums=('SKIP'
            'ecfb109a680f308a9a5da1bc648111f108a05a3031d13c2e0460fbb5d719cc9c')

pkgver() {
    cd "$srcdir/dsf2flac"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/dsf2flac"
    patch -Np1 -i ../dsf2flac-fix-build-with-boost-1.76.patch
    ./autogen.sh
}

build() {
    cd "$srcdir/dsf2flac"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/dsf2flac"
    make install DESTDIR="$pkgdir"
}
