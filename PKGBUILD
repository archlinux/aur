# Maintainer: Rustem B. <rustemb@systemli.org>
pkgname=bitfetch-git
pkgver=3.1.r1.ga6aff19
pkgrel=1
pkgdesc="Simple fetch written in C."
arch=(any)
url="https://gitlab.com/bit9tream/bitfetch"
license=('GPL2')
groups=()
depends=(libx11 libxinerama)
makedepends=(git pkgconf)
checkdepends=()
optdepends=()
provides=(bitfetch)
source=("${pkgname}::git+https://gitlab.com/bit9tream/bitfetch.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Artix will be used when no /etc/os-release file on your system
build() {
    cd "${pkgname}"
    [ -f "/etc/os-release" ] && make bitfetch || make bitfetch ID=artix
}

package() {
    cd "${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/bitfetch/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/bitfetch/LICENSE"
    make DESTDIR="$pkgdir/" install

}
