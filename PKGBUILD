# Maintainer: jem <jem ΑΤ seethis DΟΤ link>
pkgname=keyplusd-git
_gitname=keyplus
pkgver=v0.2.0.beta.r407.g37c9804
pkgrel=2
epoch=
pkgdesc="keyboard remapping tool that emulates keyplus firmware"
arch=('i686' 'x86_64')
url="https://github.com/ahtn/keyplus/tree/master/ports/linux"
license=('MIT')
groups=()
depends=('keyplus' 'systemd' 'libevdev')
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
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_gitname
    cd ports/linux
    make PREFIX=/usr
}

package() {
    cd $_gitname
    cd ports/linux
    make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm 644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
