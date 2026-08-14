# Maintainer: Xavier Moffett (sapphirus at azorium dot net)
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

_pkgbase=ocp
pkgname=('ocp' 'ocp-sdl3')
pkgver=3.5.0
pkgrel=1
pkgdesc="Open Cubic Player"
arch=('i686' 'x86_64')
url="https://stian.cubic.org/project-ocp.php"
license=('GPL')
source=(${_pkgbase}::git+https://github.com/mywave82/opencubicplayer.git#tag=v${pkgver})
sha256sums=('SKIP')
optdepends=(
    'libgme: Video game music emulation/playback support'
    'opus: Opus codec support'
    'speex: Video game voice emulation/playback support'
)
makedepends=(
    'alsa-lib'
    'bzip2'
    'cjson'
    'desktop-file-utils'
    'freetype2'
    'flac'
    'git'
    'libancient'
    'libdiscid'
    'libgme'
    'libjpeg-turbo'
    'libmad'
    'libogg'
    'libpng'
    'libvorbis'
    'ncurses'
    'opus'
    'speex'
    'sdl3'
    'xa'
)

prepare() {
        cd $_pkgbase
        git submodule init
        git submodule update --init --recursive
}

build() {
        cd $_pkgbase
        ./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core --with-strip_lto_flags cross_compiling=yes\
        --without-update-desktop-database\
        --without-update-mime-database\
        --with-unifont-ttf=/usr/share/fonts/Unifont/Unifont.ttf\
        --with-unifont-csur-ttf=/usr/share/fonts/Unifont/Unifont_CSUR.ttf\
        --with-unifont-upper-ttf=/usr/share/fonts/Unifont/Unifont_Upper.ttf
        make DESTDIR="$pkgdir" subdirs ocp ocp.hlp
}

package_ocp-sdl3() {
        provides=(${_pkgbase}=${pkgver})
        conflicts=('ocp' 'ocp-sdl2' 'ocp-sdl3' 'ocp-curses')
        replaces=('ocp-sdl3')
        install=${_pkgbase}.install
        depends=(
            'alsa-lib'
            'bzip2'
            'cjson'
            'flac'
            'freetype2'
            'hicolor-icon-theme'
            'libancient'
            'libdiscid'
            'libjpeg-turbo'
            'libmad'
            'libogg'
            'libpng'
            'libvorbis'
            'ncurses'
            'sdl3'
            'shared-mime-info'
            'ttf-unifont'
            'zlib'
        )

        cd $_pkgbase
        ./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core --with-strip_lto_flags cross_compiling=yes\
        --without-sdl\
        --without-sdl2\
        --without-x11\
        --without-update-desktop-database\
        --without-update-mime-database\
        --with-unifont-ttf=/usr/share/fonts/Unifont/Unifont.ttf\
        --with-unifont-csur-ttf=/usr/share/fonts/Unifont/Unifont_CSUR.ttf\
        --with-unifont-upper-ttf=/usr/share/fonts/Unifont/Unifont_Upper.ttf
        make DESTDIR="$pkgdir" libocp.so
        make DESTDIR="$pkgdir" install
}

package_ocp() {
        provides=(${_pkgbase}=${pkgver})
        conflicts=('ocp' 'ocp-sdl2' 'ocp-sdl3' 'ocp-curses')
        depends=(
            'alsa-lib'
            'bzip2'
            'cjson'
            'flac'
            'libancient'
            'libdiscid'
            'libjpeg-turbo'
            'libmad'
            'libogg'
            'libpng'
            'libvorbis'
            'ncurses'
            'zlib'
        )

        cd $_pkgbase
        ./configure --prefix=/usr --sysconfdir=/etc --with-builtin=core --with-strip_lto_flags cross_compiling=yes\
        --without-x11\
        --without-sdl\
        --without-sdl2\
        --without-sdl3\
        --without-update-desktop-database\
        --without-update-mime-database
        make DESTDIR="$pkgdir" libocp.so
        make DESTDIR="$pkgdir" install
}

# vim:set ts=4 sw=4 et:1
