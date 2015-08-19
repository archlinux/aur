_pkgname=ps2emu
pkgname=${_pkgname}-git
pkgver=v0.1.r39.gf04ff09
pkgrel=1
pkgdesc='PS/2 emulation tools for recording and playing back PS/2 devices'
arch=('i686' 'x86_64')
url='https://github.com/lyude/ps2emu'
license=('GPL2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Lyude/ps2emu.git#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    ./autogen.sh --prefix=/usr --sbindir=/usr/bin
    make
}

package() {
    cd "${_pkgname}"
    make DESTDIR="$pkgdir" install
}
