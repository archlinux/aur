# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=cadence-git
pkgver=20150712
pkgrel=1
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
    cd ${srcdir}/${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

# vim:set ts=4 sw=4 et:
