# Maintainer: Aoibhinn Nic Aoidh <aoibhinn.nic.aoidh+aur@gmail.com>
# Contributor: Yardena Cohen <yardenack at gmail dot com>

gitname=htim
pkgname=${gitname}-git
pkgver=3.0.6
pkgrel=1
epoch=1
pkgdesc="Htop improved, htop with vim key bindings"
url="https://gitlab.com/thelinuxguy9/htim"
license=('GPL')
arch=('i686' 'x86_64')
depends=(ncurses libnl)
makedepends=('git' 'python')
optdepends=('lsof: list open files for running process'
            'strace: attach to running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("git+https://gitlab.com/thelinuxguy9/htim")
sha256sums=('SKIP')

# pkgver() {
#     cd "${srcdir}/${gitname}"
#     local ver="$(git describe --tags)"
#     printf "%s" "${ver//-/.}"
# }

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

