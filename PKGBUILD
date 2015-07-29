# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=cadence-git
pkgver=r971.f8b18cf
pkgrel=1
epoch=1
pkgdesc="JACK Audio Toolbox."
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/cadence"
license=('GPL2')
depends=('python-pyqt4' 'python-dbus' 'jack')
optdepends=(
    'a2jmidid: alsa-midi bridge'
    'pulseaudio: pulseaudio bridge'
    'zita-ajbridge: alternate alsa-audio bridge'
    'jack_capture: needed for cadence-render'
    'ladish: needed for claudia'
)
provides=('cadence')
conflicts=('cadence')
source=("${pkgname}::git+https://github.com/falkTX/Cadence.git")
md5sums=('SKIP')
install=cadence-git.install

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

# vim:set ts=4 sw=4 et:
