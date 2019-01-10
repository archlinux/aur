# Maintainer: Jan Cholasta <grubber at grubber cz>

_name=slade
pkgname=${_name}-git
pkgver=3.1.4+105+g1c78539e
pkgrel=1
pkgdesc='SLADE3 Doom editor (git version)'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL')
depends=('bzip2'
         'curl'
         'fluidsynth'
         'freeimage'
         'ftgl'
         'glew>=2.1'
         'glew<2.2'
         'glu'
         'gtk3'
         'libgl'
         'sfml>=2.5'
         'sfml<2.6'
         'webkit2gtk'
         'wxgtk3>=3.0'
         'zlib')
makedepends=('cmake'
             'git'
             'p7zip')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git://github.com/sirjuddington/SLADE.git")
sha256sums=('SKIP')

pkgver() {
    cd slade

    git describe --long --tags | sed -r 's/-/+/g'
}

build() {
    cd slade

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
          .
    make
}

package() {
    cd slade

    make install DESTDIR="$pkgdir"
}
