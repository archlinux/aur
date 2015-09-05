# Maintainer: Ossi Saukko <osaukko at gmail dot com>
_name=opencubicplayer
pkgname=opencubicplayer-git
pkgver=0.1.21.r56.63e5fc1
pkgrel=1
pkgdesc="A music file player for Linux, Unix, DOS and Windows 95-ME, XP."
arch=('i686' 'x86_64')
url="http://stian.cubic.org/project-ocp.php"
license=('GPL')
depends=('hicolor-icon-theme'
         'libxpm'
         'libxxf86vm')
optdepends=('adplug: for OPL formats support'
            'alsa-lib: for ALSA output'
            'flac: for FLAC audio support'
            'libmad: for MPEG audio support'
            'libsidplay: for SID music support'
            'libvorbis: for Vorbis audio support'
            'sdl: for SDL user interface support')
makedepends=('git')
install=$pkgname.install
source=("${_name}::git://git.code.sf.net/p/opencubicplayer/code")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "%s.r%s.%s" "$(grep VERSION Changelog|tail -n 1|sed 's/.* //g')" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_name}"
    ./configure --prefix=/usr

    # Compiling LZH first to avoid linking error
    cd "${srcdir}/${_name}/playym/lzh"
    make

    cd "${srcdir}/${_name}"
    make
}

package() {
    cd "${srcdir}/${_name}"
    make DESTDIR="${pkgdir}" install
}
