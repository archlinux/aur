# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>

pkgname=coriander
pkgver=2.0.2
pkgrel=5
pkgdesc="Coriander is a Graphical User Interface for controlling IEEE1394 (Firewire) cameras"
arch=('i686' 'x86_64')
url="http://damien.douxchamps.net/ieee1394/coriander"
license=('GPL3')
depends=('sdl' 'libgnomeui' 'libraw1394' 'libdc1394' 'libxv')
source=("http://downloads.sourceforge.net/coriander/${pkgname}-${pkgver}.tar.gz"
        "coriander.desktop")
sha256sums=('5c7fd31cb58d398e2742352bf1ffbd2ca22e06686c6668ecfd437735c2b79123'
            'adcfa4d3da6f029b1d03909501d4028d762486bdb7bf8d78de3944154df4d648')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure
    make
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    if [ ! -f $HOME/.local/share/applications/${pkgname}.desktop ]
    then
        cp ${srcdir}/${pkgname}.desktop $HOME/.local/share/applications
    fi
}
