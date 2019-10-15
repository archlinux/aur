# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Submitter:  Pascal Potvin <pascal dot potvin at gmail dot com>

pkgname=terraform-provider-libvirt
pkgver=0.6.0
pkgrel=0
pkgdesc="Terraform provider to provision infrastructure with Linux's KVM using libvirt"
url="https://github.com/dmacvicar/terraform-provider-libvirt"
arch=("x86_64")
license=("apache")
makedepends=("go" "git")
_namespace="github.com/dmacvicar/"
depends=("terraform" "libvirt")
source=("https://github.com/dmacvicar/terraform-provider-libvirt/archive/v$pkgver.tar.gz")
sha256sums=(
    '83ff13c9420035bfbfe631769f8c42a2bff388187b0637f3ebe58c50c9caf94c'
)

prepare() {
    GOPATH="$(pwd)/go"
    mkdir -p "$GOPATH/src/$_namespace"
    rm -rf "$GOPATH/src/$_namespace/$pkgname"
    mv -f "$pkgname-$pkgver" "$GOPATH/src/$_namespace/$pkgname"
}

build() {
    export GOPATH="$(pwd)/go"
    GOBIN="$GOPATH/bin"
    cd "$GOPATH/src/$_namespace/$pkgname"
    PATH="$GOBIN:$PATH" go get -v
}


package() {
    GOPATH="$(pwd)/go"
    GOBIN="$GOPATH/bin"
    install -Dm755 "$GOBIN/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
