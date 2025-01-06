# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=obs-pipewire-audio-capture-git
pkgver=1.1.5.r17.gb4ca0a8
pkgrel=1
pkgdesc='PipeWire audio capturing for OBS Studio (git)'
arch=(x86_64)
url=https://github.com/dimtpap/obs-pipewire-audio-capture
license=(GPL-2.0-or-later)
depends=(obs-studio wireplumber)
optdepends=('pipewire-pulse: record PulseAudio applications'
            'pipewire-jack: record JACK applications'
            'pipewire-alsa: record ALSA applications')
makedepends=(cmake git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
