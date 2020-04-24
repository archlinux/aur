# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=conform
pkgver=0.1.0_alpha.19
_commit=b3b6e657fbd4c94f57b81ac95885339ff4ee1b59
pkgrel=1
pkgdesc='Policy enforcement for your pipelines'
arch=('i686' 'x86_64')
url='https://github.com/talos-systems/conform'
license=('MPL2')
depends=('glibc')
makedepends=('git' 'go')
source=("git+https://github.com/talos-systems/conform.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd conform

    BUILT="$(date --utc +%a,\ %d\ %b\ %Y\ %H:%M:%S\ UTC)"
    SHA="${_commit:0:7}"
    TAG="$(git describe --tags --always --dirty)"
    go build \
        -buildmode=pie \
        -ldflags "-extldflags=${LDFLAGS} -s -w -X \"github.com/talos-systems/conform/cmd.Tag=${TAG}\" -X \"github.com/talos-systems/conform/cmd.SHA=${SHA}\" -X \"github.com/talos-systems/conform/cmd.Built=${BUILT}\"" \
        -trimpath
}

package() {
    cd conform

    install -Dm755 -t "${pkgdir}/usr/bin" conform
}
