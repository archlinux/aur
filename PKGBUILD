# Maintainer: JuanPerdomo00  j4kyjak3@proton.me
pkgname=glain-git
pkgver=r6.58c0105
pkgrel=1
pkgdesc="fastfetch + lain gifs written in Go"
arch=('x86_64')
url="https://github.com/JuanPerdomo00/glain"
license=('GPL3')
depends=('fastfetch' 'timg')
makedepends=('go' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    go build -o glain .
}

package() {
    cd "$pkgname"
    install -Dm755 glain "$pkgdir/usr/local/bin/glain"
    install -Dm644 .gif-index "$pkgdir/usr/share/glain/.gif-index"
    install -Dm644 margin.txt "$pkgdir/usr/share/glain/margin.txt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
