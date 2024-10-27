# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=slade-git
pkgver=3.2.6+2+g25cbba80
pkgrel=1
pkgdesc='SLADE3 Doom editor (git version)'
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
             'git'
             'p7zip')
provides=('slade')
conflicts=('slade')
source=('slade::git+https://github.com/sirjuddington/SLADE.git')
sha256sums=('SKIP')

pkgver() {
    cd slade

    git describe --long --tags | sed -r 's/-/+/g'
}

build() {
    cd slade

    export CCACHE_SLOPPINESS=pch_defines,time_macros
    cmake -D CMAKE_BUILD_TYPE=None \
          -D CMAKE_INSTALL_PREFIX=/usr \
          .
    make
}

package() {
    cd slade

    make install DESTDIR="$pkgdir"
}

# vim: ts=2 sw=2 et:
