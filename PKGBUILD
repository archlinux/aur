# Maintainer: jem <jem ΑΤ seethis DΟΤ link>
pkgname=keyplusd-git
_gitname=keyplus
pkgver=0.4.0a1.r2.g9793bd3
pkgrel=2
epoch=
pkgdesc="keyboard remapping tool that emulates keyplus firmware"
arch=('i686' 'x86_64')
url="https://github.com/ahtn/keyplus/tree/master/ports/linux"
license=('MIT')
groups=()
depends=('keyplus-git' 'systemd' 'libevdev')
makedepends=('git' 'make' 'gcc' 'python')
checkdepends=()
optdepends=()
provides=('keyplusd')
conflicts=('keyplusd')
replaces=()
backup=()
options=()
install=
changelog=
source=(
    'git+https://github.com/ahtn/keyplus.git'
)
md5sums=(
    'SKIP'
)
noextract=()
validpgpkeys=()

pkgver() {
    cd $_gitname
    git describe --long --tags --match "*.*.*" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_gitname
    cd ports/linux
    make PREFIX=/usr
}

package() {
    cd $_gitname
    cd ports/linux
    make DESTDIR="$pkgdir/" PREFIX=/usr install NO_USER=1
    install -Dm 644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
