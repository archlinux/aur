# Maintainer: Abdullah Khabir <abdullahx1c@gmail.com>
pkgname=age-plugin-sshagent
pkgver=0.1.1
pkgrel=1
pkgdesc='age plugin deriving X25519 identities from deterministic ssh-agent signatures'
arch=('x86_64')
url='https://github.com/eszio/age-plugin-sshagent'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eszio/age-plugin-sshagent/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('aee33de6696794f4a6de095227b2dce9cb4633a222b499cc87469a7a62c09e6a0f46a1a911b9ef11182280935c67990137771db02b118f696387564f84dd65e4')

build() {
    cd "$pkgname-$pkgver"
    go build -trimpath -ldflags "-buildid= -s -w" -o age-plugin-sshagent .
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 age-plugin-sshagent \
        "$pkgdir/usr/bin/age-plugin-sshagent"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
