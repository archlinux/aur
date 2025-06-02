# Maintainer: Hanashiko <hlichisper@gmail.com>
pkgname=portchaos
pkgver=0.1.0
pkgrel=1
pkgdesc="Random fake TCP services on random ports for firewall testing, honeypots, and pentesting"
arch=('x86_64')
url="https://github.com/Hanashiko/portchaos"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("main.go" "LICENSE")
sha256sums=('3cfdfe0f1bb92bcce056854a6fd8ef8b545381657285c0eecc9f09206f42d760' 
    '2caa115b6f809a4f34067ba1bc7550b2f5f39e1915d88eed9d77bc30af278022')

build() {
    go build -trimpath -buildmode=pie -ldflags="-linkmode=external -extldflags=-Wl,-z,relro,-z,now -s -w" -o "$pkgname" main.go
}

package() {
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
