pkgname=push2talk-git
_pkgname=${pkgname%-git}
pkgver=1.1.0.r0.gde66413
pkgrel=1
pkgdesc="Push to talk application."
arch=('x86_64' 'aarch64')
url="https://github.com/cyrinux/push2talk"
license=('ISC')
depends=('pulseaudio' 'libevdev' 'libxkbcommon-x11' 'libinput')
makedepends=('cargo' 'git' 'pkg-config' 'systemd-libs')
conflicts=("push2talk" "push2talk-bin")
provides=("push2talk")
source=("${_pkgname}::git+$url.git#branch=main")
validpgpkeys=('C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
    cd "${_pkgname}"
    make test
}

build() {
    cd "${_pkgname}"
    make build
}

package() {
    cd "${_pkgname}"
    make install DESTDIR="${pkgdir}"
}
