# Maintainer: Alex Szczuczko <alex@szc.ca>
# Contributor: Marcelo Alaniz <malaniz@code4life.com.ar>

pkgname=nusmv
_pkgname=NuSMV
pkgver=2.6.0
pkgrel=2
pkgdesc="A new symbolic model checker"
arch=('i686' 'x86_64')
url="http://nusmv.fbk.eu/index.html"
license=('LGPL2.1')
depends=('libxml2')
makedepends=('cmake' 'python2' 'ghostscript' 'texlive-latexextra')
optdepends=('perl: for scripts in /usr/share/nusmv/contrib/')
source=("http://nusmv.fbk.eu/distrib/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('dba953ed6e69965a68cd4992f9cdac6c449a3d15bf60d200f704d3a02e4bbcbb')

build() {
    cd "$srcdir/$_pkgname-$pkgver/$_pkgname"

    mkdir build
    cd build
    cmake .. -DPYTHON_EXECUTABLE=/bin/python2 -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/$_pkgname/build"

    make DESTDIR="$pkgdir/" install
    find "$pkgdir" -type f -name "*.a" -print0 | xargs -0 rm

    # Lowercase symlink
    ln -s "/usr/bin/NuSMV" "$pkgdir/usr/bin/$pkgname"
}
