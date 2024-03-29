# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=htop
pkgname=${gitname}-git
pkgver=3.3.0.r64.gef6658c2
pkgrel=1
epoch=1
pkgdesc="Interactive text-mode process viewer"
url="https://github.com/htop-dev/htop"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')
depends=('libcap' 'libcap.so' 'libnl' 'ncurses' 'libncursesw.so')
makedepends=('git' 'lm_sensors')
optdepends=('lsof: list open files for running process'
            'strace: attach to running process'
           'lm_sensors: temperature monitoring')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	 cd "${srcdir}/${gitname}"

	 ./autogen.sh

	 ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-unicode \
        --enable-openvz \
        --enable-vserver
}

build() {
	 cd "${srcdir}/${gitname}"
	 make
}

package() {
	 cd "${srcdir}/${gitname}"
	 make DESTDIR="${pkgdir}" install
}
