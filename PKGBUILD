# Maintainer: envolution
# Contributor: Jan Cholasta <grubber at grubber cz>

pkgname=slade
pkgver=3.2.7
pkgrel=3
pkgdesc='SLADE3 Doom editor'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL')
depends=('bzip2'
         'fluidsynth>=2.3'
         'freeimage'
         'ftgl'
         'glu'
         'gtk3'
         'libgl'
         'lua'
         'mpg123'
         'sfml>=2.6'
         'webkit2gtk-4.1'
         'wxwidgets-gtk3>=3.2'
         'zlib')
makedepends=('cmake'
             'p7zip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sirjuddington/SLADE/archive/${pkgver}.tar.gz")
sha256sums=('842aa562dc0aa39627866babe0ea3bb033aac3a2be2c2aaa71d8be3664f617ad')

build() {
    cd SLADE-${pkgver}

    export CCACHE_SLOPPINESS=pch_defines,time_macros
    cmake -D CMAKE_BUILD_TYPE=None \
          -D CMAKE_INSTALL_PREFIX=/usr \
          .
    make
}

package() {
    cd SLADE-${pkgver}

    make install DESTDIR="$pkgdir"
}

# vim: ts=2 sw=2 et:
