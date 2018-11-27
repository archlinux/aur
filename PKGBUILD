# Maintainer: Jan Cholasta <grubber at grubber cz>

_name=slade
pkgname=${_name}
pkgver=3.1.2
pkgrel=1
pkgdesc='SLADE3 Doom editor'
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
             'p7zip')
source=("https://github.com/sirjuddington/SLADE/archive/${pkgver}.tar.gz")
sha256sums=('213d8ac065e3ec06e7e7df39695a58296f7ca435c10244389b21d9f91ed49724')

build() {
    cd SLADE-${pkgver}

    ln -sf /usr/bin/wx-config-gtk3 wx-config

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DWITH_WXPATH=. \
          .
    make
}

package() {
    cd SLADE-${pkgver}

    make install DESTDIR="$pkgdir"
}
