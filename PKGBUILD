# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

pkgname=q4wine
pkgver=1.3.7
pkgrel=3
pkgdesc="A Qt5 GUI for Wine"
arch=("x86_64")
url="http://sourceforge.net/projects/${pkgname}/"
license=("GPL3")
depends=("qt5-base" "wine" "sqlite3" "which" "icoutils")
makedepends=("cmake" "qt5-tools" "qt5-svg")
optdepends=("winetricks" "fuseiso")
options=('!emptydirs')
source=("https://github.com/brezerk/q4wine/archive/v${pkgver}.tar.gz"
        "qt5.patch::https://github.com/brezerk/q4wine/commit/909bc7ffa7a2f704d669315c262ef39db1ef25b1.patch")
sha256sums=('525672aca875f459734559c1403e19909b1c9c6c705f48795745f91bf4c8d195'
            'ffd413a95cd3a56af1c073863d9cccb4016f01a3bb40f34474d10baa99f1f356')
            
prepare() {
    cd "$srcdir"/${pkgname}-${pkgver/_/-}
    patch -Np1 < ../qt5.patch # Fix issue/125
}
            
build() {
  cd "$srcdir"/${pkgname}-${pkgver/_/-}
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBS_ENTRY_PATH=/usr/lib/$pkgname \
    -DQT5=ON \
    .
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver/_/-}
  make DESTDIR="$pkgdir" install
}
