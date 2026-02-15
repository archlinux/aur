# Maintainer: MrToadie <toadie@toadie.de>

pkgname=kvm-configurator
pkgver=1.0.9.6
pkgrel=1
pkgdesc="Small helper program for virt-install to easily create virtual machines in the terminal"
arch=('x86_64')
url="https://github.com/mrtoadie/kvm-configurator"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'base-devel')
source=("git+${url}.git")
sha256sums=('SKIP')


build() {
    cd "$srcdir/kvm-configurator/kvm-configurator/"
    # if the project uses Go‑Modules (go.mod exists):
    go mod tidy
    go build -v -o "$pkgname"
}

package() {
    # create target directories within the sandbox root ($pkgdir).
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"

    # copy the actual built binary
    install -m755 "$srcdir/kvm-configurator/kvm-configurator/$pkgname" \
                   "$pkgdir/usr/bin/$pkgname"

    # copy config file
    install -m644 "$srcdir/kvm-configurator/kvm-configurator/oslist.yaml" \
                   "$pkgdir/usr/share/doc/$pkgname/oslist.yaml"
}
