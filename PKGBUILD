# Maintainer: jem <jem ΑΤ seethis DΟΤ link>
pkgname=keyplus-git
pkgver=0.3.3.r77.gb9cc778
pkgrel=1
epoch=
pkgdesc="keyboard firmware library and tools"
arch=('any')
url="https://github.com/ahtn/keyplus/"
license=('MIT')
groups=()
depends=(
    'python-ruamel-yaml' 'python-intelhex' 'python-hexdump'
    'python-colorama' 'python-cstruct'
    'python-easyhid' 'python-xusbboot' 'python-efm8boot' 'python-kp_boot_32u4'
)
makedepends=('git' 'python')
checkdepends=()
optdepends=('keyplusd-git: keyplus emulator support')
provides=('keyplus')
conflicts=('keyplus')
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

_srcdir="keyplus/host-software"

pkgver() {
    cd $_srcdir
    git describe --long --tags --match "*.*.*" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_srcdir
    python setup.py build
}

package() {
    cd $_srcdir
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
