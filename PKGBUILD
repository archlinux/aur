# Maintainer: Jan Cholasta <grubber at grubber cz>

_name=slade
pkgname=${_name}
pkgver=3.2.0_b2
pkgrel=2
pkgdesc='SLADE3 Doom editor'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL')
depends=('bzip2'
         'curl'
         'fluidsynth>=2.0'
         'fmt>=7'
         'freeimage'
         'ftgl'
         'glew>=2.2'
         'glu'
         'gtk3'
         'libgl'
         'lua53'
         'mpg123'
         'sfml>=2.5'
         'webkit2gtk'
         'wxgtk3>=3.0'
         'zlib')
makedepends=('cmake'
             'p7zip')
source=("https://github.com/sirjuddington/SLADE/archive/${pkgver}.tar.gz")
sha256sums=('e139173840351135cb0864facc7ece1c52f0e291f56b769123512614f876ec26')

build() {
    cd SLADE-${pkgver}

    export CCACHE_SLOPPINESS=pch_defines,time_macros
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
          .
    make
}

package() {
    cd SLADE-${pkgver}

    make install DESTDIR="$pkgdir"
}
