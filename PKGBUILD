#Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=containerd
pkgver=0.1.0
pkgrel=1
pkgdesc="Standalone Container Daemon"
depends=('runc')
makedepends=('go')
arch=('x86_64' 'i686')
source=("https://github.com/docker/containerd/archive/v$pkgver.tar.gz")
url="https://containerd.tools/"
license=("APACHE")
sha256sums=('23973dae3eddf405108e88ea55c5ba9afdc3ce4333c4592516d34e41321fedcc')

prepare() {
    cd ${srcdir}
    install -d "src/github.com/docker"
    mv "${pkgname}-${pkgver}" "src/github.com/docker/${pkgname}"
}

build() {
    cd "${srcdir}/src/github.com/docker/${pkgname}"
    LDFLAGS="" GOPATH="$srcdir:$srcdir/src/github.com/docker/${pkgname}/vendor" make
}

package() {
    cd "${srcdir}/src/github.com/docker/${pkgname}/bin"
    for file in $(find . -type f -print); do
        install -Dm755 $file $pkgdir/usr/bin/$file
    done
}
