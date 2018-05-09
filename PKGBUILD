# Maintainer: Jan Cholasta <grubber at grubber cz>

_name=slade
pkgname=${_name}-git
pkgver=3.1.2_b5+47+g94dd36e7
pkgrel=1
pkgdesc='SLADE3 Doom editor (git version)'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL')
depends=('bzip2'
         'curl'
         'desktop-file-utils'
         'fluidsynth'
         'freeimage'
         'freetype2'
         'ftgl'
         'glew'
         'gtk2'
         'libgl'
         'sfml>=2.5'
         'sfml<2.6'
         'wxgtk2>=3.0'
         'zlib')
makedepends=('cmake'
             'git'
             'p7zip')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git://github.com/sirjuddington/SLADE.git"
        "${_name}.desktop")
sha256sums=('SKIP'
            'e69d6e0da523c5d649bd51316fa827175b5858cb91b4ad311b2f0d0dedd8b9bb')

pkgver() {
    cd slade

    git describe --long --tags | sed -r 's/-/+/g'
}

build() {
    cd slade

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DNO_WEBVIEW=ON \
          .
    make
}

package() {
    cd slade

    make install DESTDIR="$pkgdir"
}
