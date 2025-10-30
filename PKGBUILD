# Maintainer: E.A.Davison <eadavison at protonmail dot com>

pkgname=ctune-git
pkgver=v1.3.9
pkgrel=0
pkgdesc="NCurses internet radio player for Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/An7ar35/ctune"

depends=('ncurses'
         'openssl'
         'curl'
         'ffmpeg'
         'alsa-lib'
         'libbsd'
         'json-c')

makedepends=('make'
             'cmake'
             'git')

optdepends=('pulseaudio: for PulseAudio plugin support'
            'pipewire-pulse: for using the pulseaudio plugin on Pipewire'
            'pipewire: for PipeWire plugin support'
            'sdl2: for SDL2 output plugin support'
            'sndio: for SNDIO output plugin support'
            'vlc: for VLC player plugin support'
            'pandoc-cli: To compile the man page from source')

conflicts=('ctune')
provides=('ctune')
license=('AGPL3')
source=(git+https://github.com/An7ar35/ctune.git#tag=v1.3.9)
sha512sums=('SKIP')

build() {
    cmake -B ctune_build -S "ctune" \
          -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
          -DCMAKE_INSTALL_PREFIX='/usr' \
          -Wno-dev
    cmake --build ctune_build
}

package() {
    DESTDIR="$pkgdir" cmake --install ctune_build
}
