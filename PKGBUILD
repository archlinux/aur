# Maintainer: Florian De Temmerman <floriandetemmerman@gmail.com>
pkgname=torrenttools
pkgver=0.6.0
pkgrel=1
pkgdesc="Commandline tool for inspecting, creating and editing BitTorrent metafiles."
arch=('x86_64' 'aarch64')
url="https://github.com/fbdtemme/torrenttools"
license=("MIT")
groups=()
depends=("openssl" "intel-tbb")
makedepends=("cmake" "make" "git" "nasm" "autoconf" "automake" "m4")
optdepends=()
provides=("torrenttools")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fbdtemme/torrenttools/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')


build() {
    mkdir -p cmake-build
    
    cmake -S "$srcdir/$pkgname-$pkgver" -B "cmake-build" \
        -DCMAKE_BUILD_TYPE="None" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DTORRENTTOOLS_BUILD_TESTS=OFF \
        -DTORRENTTOOLS_BUILD_DOCS=OFF \
        -DDOTTORRENT_CRYPTO_LIB=openssl \
        -DDOTTORRENT_MB_CRYPTO_LIB=isal \
	-DSYSCONF_INSTALL_DIR=/etc \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON

    cd cmake-build
    make torrenttools
}

package() {
    DESTDIR=$pkgdir cmake --install "$srcdir/cmake-build" --component torrenttools --prefix "/usr"
}
