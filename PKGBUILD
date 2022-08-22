# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=ubridge
pkgname=${_pkgname}-git
pkgver=v0.9.18.r13.g214d372
pkgrel=1
pkgdesc='Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces'
arch=('any')
url="https://github.com/GNS3/${_pkgname}"
license=('GPL3')
groups=('gns3')
depends=('libpcap')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/GNS3/${_pkgname}.git")
install="${_pkgname}.install"
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 README.rst "$pkgdir/usr/share/doc/$_pkgname/README.rst"
}
