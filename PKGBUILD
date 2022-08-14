# Maintainer: Zhang Hua <zhanghua.00@qq.com>
# Contributer: James P. Harvey <jamespharvey20 at gmail dot com>
# Contributer: Christoph Bayer <chrbayer@criby.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Fredy García <frealgagu at gmail dot com>

pkgname=mongodb-tools-git
pkgver=100.5.4.r6.g1d46e6e7
pkgrel=1
pkgdesc="The MongoDB tools provide import, export, and diagnostic capabilities."
arch=('x86_64' 'aarch64')
url="https://github.com/mongodb/mongo-tools"
license=('Apache')
depends=('libpcap')
makedepends=('go' 'git')
conflicts=('mongodb-tools')
provides=('mongodb-tools')
source=("git+${url}")
sha512sums=('SKIP')

pkgver(){
    cd "${srcdir}/mongo-tools"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/mongo-tools"
    export GOPATH="${srcdir}/go"
    ./make build
}
package(){
    cd "${srcdir}/mongo-tools"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 bin/* "${pkgdir}/usr/bin"
}
