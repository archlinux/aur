# Maintainer: Simon Walker <s.r.walker101@googlemail.com>
pkgname=terraform-provider-libvirt-git
pkgver=r841.753afd8a074e
pkgrel=1
epoch=
pkgdesc="Provision libvirt machines with terraform"
arch=("x86_64")
url="https://github.com/dmacvicar/terraform-provider-libvirt"
license=("Apache")
groups=()
depends=("libvirt")
makedepends=("go-pie")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+${url}")
noextract=()
md5sums=()
validpgpkeys=()
sha256sums=('SKIP')

pkgver() {
    cd terraform-provider-libvirt
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd terraform-provider-libvirt

    go build \
        -gcflags "all=-trimpath=${PWD}" \
        -asmflags "all=-trimpath=${PWD}" \
        -ldflags "-extldflags ${LDFLAGS}"
    }

package() {
    (
    cd "terraform-provider-libvirt"
    install -Dm755 ./terraform-provider-libvirt "${pkgdir}/usr/bin/terraform-provider-libvirt"
    )
}
