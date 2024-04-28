# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=obs-pipewire-audio-capture-multiple-git
pkgver=1.1.3.r5.gc35fb3c
pkgrel=1
pkgdesc='PipeWire audio capturing for OBS Studio (multiple-apps-per-source branch)'
arch=(x86_64)
url=https://github.com/dimtpap/obs-pipewire-audio-capture/tree/multiple-apps-per-source
license=(GPL-2.0-or-later)
depends=(obs-studio wireplumber)
optdepends=('pipewire-pulse: record PulseAudio applications'
            'pipewire-jack: record JACK applications'
            'pipewire-alsa: record ALSA applications')
makedepends=(cmake git)
provides=("${pkgname%-multiple-git}")
conflicts=("${pkgname%-multiple-git}")
source=(git+https://github.com/dimtpap/obs-pipewire-audio-capture.git#branch=multiple-apps-per-source)
md5sums=('SKIP')

pkgver() {
    git -C "${pkgname%-multiple-git}" describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${pkgname%-multiple-git}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
