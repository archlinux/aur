# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic-git
pkgver=0.r9473.88d966d9e
pkgrel=1
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="http://dcpomatic.com/"
license=('GPL2')
depends=('pangomm>=1.4' 'libsub-git' 'libcxml-git' 'libdcp-git' 'ffmpeg' 'glib2' 'imagemagick' 'libssh' 'wxgtk2>=3.0.1' 'libquickmail>=0.1.22' 'libzip' 'xz' 'libsndfile' 'libsamplerate' 'pangomm' 'rtaudio')
makedepends=('python2' 'boost>=1.65.1' 'git' )

provides=('dcpomatic')
conflicts=('dcpomatic')
source=('dcpomatic-git::git://git.carlh.net/git/dcpomatic.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd dcpomatic-git
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    PKG_CONFIG_LIBDIR="/usr/lib64/pkgconfig/:/usr/lib/pkgconfig/:$PKG_CONFIG_LIBDIR"
    CXXFLAGS="$CXXFLAGS    --std=c++11"
    cd  dcpomatic-git
    python waf configure --prefix=/usr
    python waf build
}


package() {
    cd dcpomatic-git
    python waf install --destdir=$pkgdir
}
