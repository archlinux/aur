# Maintainer: Yuhanun Citgez <y dot citgez at student dot utwente dot nl>

pkgname=zmqpp-git
pkgver=1
pkgrel=1
commit_hash=7f099a8dba534661c69db32e31e13f06f34ad6bc
pkgdesc="ZMQPP's latest version"
arch=('x86_64')
url='https://github.com/zeromq/zmqpp'
licence=('MIT')
depends=('libsodium' 'zeromq')
makedepends=('make')
provides=('libzmqpp')
source=("git+$url#commit=$commit_hash")
md5sums=('SKIP')

prepare() {
    cd zmqpp
    git submodule update --init --recursive
}

build() {
    cd zmqpp
    make
}

# check() {
#     make check
# }

package() {
    cd zmqpp/build/max-g++
    mkdir -p "${pkgdir}"/opt/zmqpp-git
    install -Dm666 libzmqpp.a "${pkgdir}/opt/zmqpp-git/libzmqpp.a"

    mkdir -p "${pkgdir}/usr/lib"
    ln -s /opt/zmqpp-git/libzmqpp.a "${pkgdir}/usr/lib/libzmqpp.a"
}
