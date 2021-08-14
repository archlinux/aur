# Maintainer: Donald Carr <sirspudd _at_ gmail.com>

pkgname=goplay2-git
pkgver=0.0.62
pkgrel=1
pkgdesc='goplay2 airplay2 server'
arch=(x86_64)
url='https://github.com/openairplay/goplay2'
license=(Apache)
depends=(libfdk-aac)
makedepends=(go)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd goplay2

    #git describe --tags | sed -e "s/^v//" | tr '-' '.'
    echo "0.0.$(git rev-list HEAD --count)"
}

build() {
    cd goplay2

    go build
}

package() {
    local bin_dir="${pkgdir}/usr/bin"

    mkdir -p ${bin_dir}
    setcap 'cap_net_bind_service=+ep' goplay2/goplay2
    cp goplay2/goplay2 ${bin_dir}
}
