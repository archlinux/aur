# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=osctl
pkgver=0.3.2
_commit=fb48851d691d21ab6fc9356a8106b3e498552763
pkgrel=1
pkgdesc='A CLI for out-of-band management of Kubernetes nodes created by Talos'
arch=('i686' 'x86_64')
url='https://www.talos-systems.com'
license=('MPL2')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("git+https://github.com/talos-systems/talos.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd talos/cmd/osctl

    SHA="${_commit:0:8}"
    TAG="v${pkgver}"
    VERSION_PKG='github.com/talos-systems/talos/pkg/version'
    go build \
        -ldflags "-extldflags=-Wl,-z,now,-z,relro -s -w -X ${VERSION_PKG}.Name=Client -X ${VERSION_PKG}.SHA=${SHA} -X ${VERSION_PKG}.Tag=${TAG}"
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" talos/cmd/osctl/osctl
}
