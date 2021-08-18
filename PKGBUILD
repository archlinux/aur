# Maintainer: Ondrej Vlk <ondrej.vlk[at]fuf[dot]name>
# Maintainer: Jan Porhincak <kenaco666[at]gmail[dot]com>

readonly REPO="github.com/seznam/goenvtemplator"

pkgname=goenvtemplator-git
pkgver=v2.1.0.r1.g172ef96
pkgbase=goenvtemplator
_tag="master"
pkgrel=1
pkgdesc='Tool to template configuration files by environment variables and optionally replace itself with the target binary.'
arch=('i686' 'x86_64')
url="https://${REPO}"
license=('LGPL3')
makedepends=('go' 'git')
source=("git+https://github.com/seznam/goenvtemplator.git#tag=${_tag}")
sha256sums=("SKIP")

pkgver() {
    cd "${pkgbase}"
    git describe --long --tags | sed 's/\([^-]-g\)/r\1/;s/-/./g'
}


build() {
    cd "${srcdir}/${pkgbase}"
    make build
}

package() {
    cd "${srcdir}/${pkgbase}"
    make DESTDIR="${pkgdir}" install
}
