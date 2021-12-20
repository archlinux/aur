# Maintainer: Julia DeMille <me@jdemille.com>
# Contributor: David <ottodavid@gmx.net>
pkgname=linvst
pkgver=4.7.r11.g141e405
pkgrel=1
license=('GPL3')
pkgdesc="Windows VST2 wrapper that allows them to be used as Linux VST2s in compatible DAWs using Wine."
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
makedepends=('git')
source=('linvst::git+https://github.com/osxmidi/LinVst.git')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" all
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" VST_DIR="${pkgdir}/usr/lib/vst/"  install
}
