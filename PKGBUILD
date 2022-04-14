# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=slade
pkgver=3.2.0
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
         'wxgtk3>=3.0'
         'zlib')
makedepends=('cmake'
             'p7zip')
source=("https://github.com/sirjuddington/SLADE/archive/${pkgver}.tar.gz"
        '0001-compatibility-with-stable-wxWidgets.patch')
sha256sums=('e23cb1238d184a13912231c22e96208d6dff4eb55f38181ae92d2b67f205dfa5'
            'ababb76f64b4cfbdabd283ffb8e5d7900f270893161433e84a93f2655767d5d2')

prepare() {
    cd SLADE-${pkgver}

    patch -i "$srcdir"/0001-compatibility-with-stable-wxWidgets.patch -p 1
}

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
