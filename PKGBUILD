# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=htop
pkgname=${gitname}-git
pkgver=3.3.0.23.g4abe9f4c
pkgrel=1
epoch=1
pkgdesc="Interactive text-mode process viewer"
url="https://htop.dev"
license=('GPL')
arch=('i686' 'x86_64')
depends=(ncurses libnl)
makedepends=('git' 'python')
optdepends=('lsof: list open files for running process'
            'strace: attach to running process'
           'lm_sensors: temperature monitoring')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("git+https://github.com/htop-dev/htop.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git describe --tags)"
    printf "%s" "${ver//-/.}"
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
