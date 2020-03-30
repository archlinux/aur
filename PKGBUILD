# Maintainer: Jeffrey Zhang zhang.lei.fly@gmail.com
pkgname=assh-git
_pkgname=assh
pkgver=2.9.1
pkgrel=1
pkgdesc='make your ssh client smarter https://manfred.life/assh'
arch=('any')
url='https://github.com/moul/assh.git'
license=('MIT')
depends=()
makedepends=('git' 'go')
conflicts=()
provides=('assh')
source=("git+https://github.com/moul/assh.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    GOPATH=${srcdir} GO111MODULE=on go build -o assh
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 assh "${pkgdir}/usr/bin/assh"
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
