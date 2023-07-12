# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=slade
pkgver=3.2.4
pkgrel=1
pkgdesc='SLADE3 Doom editor'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL')
depends=('bzip2'
         'fluidsynth>=2.2'
         'freeimage'
         'ftgl'
         'glu'
         'gtk3'
         'libgl'
         'lua'
         'mpg123'
         'sfml>=2.5'
         'webkit2gtk'
         'wxwidgets-gtk3>=3.2'
         'zlib')
makedepends=('cmake'
             'p7zip')
source=("https://github.com/sirjuddington/SLADE/archive/${pkgver}.tar.gz")
sha256sums=('bded8e2218bc37c98c7f27894889433abf543d36038cde9e25d0162de7ac8f6e')

build() {
    cd SLADE-${pkgver}

    export CCACHE_SLOPPINESS=pch_defines,time_macros
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DFMT_INSTALL=OFF \
          .
    make
}

package() {
    cd SLADE-${pkgver}

    make install DESTDIR="$pkgdir"
}
