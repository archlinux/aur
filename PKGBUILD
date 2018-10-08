# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Submitter:  Pascal Potvin <pascal dot potvin at gmail dot com>

pkgname=terraform-provider-libvirt
pkgver=0.4.4
pkgrel=1
pkgdesc="Terraform provider to provision infrastructure with Linux's KVM using libvirt"
url="https://github.com/dmacvicar/terraform-provider-libvirt"
arch=("i686" "x86_64")
license=("apache")
makedepends=("go" "git")
_namespace="github.com/dmacvicar/"
depends=("terraform" "libvirt")
source=("https://github.com/dmacvicar/terraform-provider-libvirt/archive/v$pkgver.tar.gz")
sha256sums=('6d54608c29b4d708bd8b145655e26e21af1e43ea12e9c175f5834cc098c7c86b')

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
