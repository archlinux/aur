# Maintainer: katt <magunasu.b97@gmail.com>
# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail.com>

_pkgname=nvfancontrol
pkgname=$_pkgname-git
pkgver=0.3.r45.g0ba7ba3
pkgrel=1
pkgdesc="NVidia dynamic fan control"
arch=('i686' 'x86_64')
url="https://github.com/foucault/nvfancontrol"
license=('GPL3')
depends=('gcc-libs' 'libxext')
makedepends=('cargo' 'libxnvctrl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('nvidia: For GTX 4xx or newer cards'
            'nvidia-340xx: For G8x, G9x and GTX 2xx cards')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    cargo build --release
}

package() {
    install -Dm755 "${pkgname}/target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
}
