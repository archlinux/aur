# Maintainer: Jan Cholasta <grubber at grubber cz>

_name=slade
pkgname=${_name}-git
pkgver=3.2.0_b4+35+gf7bd1432
pkgrel=1
pkgdesc='SLADE3 Doom editor (git version)'
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
         'wxgtk3-dev-opt=3.1.5'
         'zlib')
makedepends=('cmake'
             'git'
             'p7zip')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git+https://github.com/sirjuddington/SLADE.git")
sha256sums=('SKIP')

pkgver() {
    cd slade

    git describe --long --tags | sed -r 's/-/+/g'
}

build() {
    cd slade

    export CCACHE_SLOPPINESS=pch_defines,time_macros
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DwxWidgets_CONFIG_EXECUTABLE=/opt/wxgtk-dev/bin/wx-config-gtk3 \
          .
    make
}

package() {
    cd slade

    make install DESTDIR="$pkgdir"
}
