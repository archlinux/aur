pkgname=('mlt-git')
srcname='mlt'
pkgdesc='Multimedia Framework'
pkgver='r1'
pkgrel='1'
arch=('i686' 'x86_64')
url="https://github.com/mltframework/${srcname}"
license=('GPL2')

optdepends=(
    'sdl_image: for SDL plugin'
    'libsamplerate: for libavresample plugin'
    'sox: for SOX (Audio Swiss Army Knife) plugin'
    'ffmpeg: for ffmpeg plugin'
    'vid.stab: for video stabilize plugin'
    'gtk2: Gtk plugin'
    'qt5-svg: for Qt5 plugins'
    'jack: for JACK sound output plugin'
    'libexif: for auto rotate plugin'
    'frei0r-plugins: for additional effects'
    'movit: opengl plugin'
)
makedepends=(
    'ladspa'
    'frei0r-plugins'
    'libdv'
    'sdl_image'
    'libsamplerate'
    'sox'
    'ffmpeg'
    'vid.stab'
    'qt5-svg'
    'jack'
    'libexif'
    'python2'
    'swig'
    'git'
    'movit'
)
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${srcname}::git+https://github.com/mltframework/${srcname}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

build() {
    cd "${srcdir}/${srcname}"

    ./configure \
        --prefix='/usr' \
        --avformat-swscale \
        --enable-gpl \
        --enable-gpl3 \
        --qt-libdir='/usr/lib' \
        --qt-includedir='/usr/include/qt'

    make
}

package() {
    cd "${srcdir}/${srcname}"

    make DESTDIR="${pkgdir}" install
}
