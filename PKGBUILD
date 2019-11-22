# Maintainer: Vitruvius <vitrvvivs dot architectus at gmail dot com>

gitname=htop
pkgname=htop-temperature-clockspeed-vim-git
pkgver=1120.b8c555c
pkgrel=1
pkgdesc="Interactive text-mode process viewer"
url="https://github.com/vitrvvivs/${gitname}"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('git' 'python2')
optdepends=('lsof: list open files for running process'
            'strace: attach to running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	 cd "${srcdir}/htop"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
        --enable-vserver \
        --enable-cgroup
}

build() {
	 cd "${srcdir}/${gitname}"
	 make
}

package() {
	 cd "${srcdir}/${gitname}"
	 make DESTDIR="${pkgdir}" install
}
