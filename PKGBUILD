# Maintainer: Hanashiko <hlichisper@gmail.com>
pkgname=i3-bind
pkgver=0.1.1
pkgrel=1
pkgdesc="A CLI/TUI utility to manage i3 window manager keybindings"
arch=('x86_64')
url="https://github.com/Hanashiko/i3-bind"
license=('MIT')
depends=('fzf' 'glibc')
makedepends=('go')
source=("main.go" "go.mod" "go.sum" "LICENSE")
sha256sums=('d60de99a5563180626d1efd8c40af57752870c8dd023a03026c769b1ff1c4e53' 
    '39b3c1658b5db83570aa40f1e1e3124e0ddfb67d1704d37258b196c10f8d7ccb' 
    'd6170414b5b3210fba21b570972174eddbb0acedb1e3a980042f827cb79923ab' 
    '2caa115b6f809a4f34067ba1bc7550b2f5f39e1915d88eed9d77bc30af278022')

build() {
    go build -trimpath -buildmode=pie -ldflags="-linkmode=external -extldflags=-Wl,-z,relro,-z,now -s -w" -o "$pkgname" main.go
}

package() {
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
