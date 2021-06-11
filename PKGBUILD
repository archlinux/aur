# Maintainer: Alwyn Kik <alwyn at kik dot pw>

pkgname=do-ansible-inventory
pkgver=2.0.0
pkgrel=1
pkgdesc="A tool to generate Ansible inventories of DigitalOcean Droplets"
url="https://github.com/do-community/do-ansible-inventory"
license=("Apache")
arch=("x86_64")
depends=("doctl")
optdepends=("ansible")
makedepends=("go" "git")
_gourl="github.com/do-community/do-ansible-inventory"
_commit="c135f1456f92a558940194a66603a3299a0e462a"
source=("git+${url}.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    go build -o "$pkgname"
}

package() {
    cd "$pkgname"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

