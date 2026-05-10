# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=i3keys
pkgver=0.0.17
pkgrel=1
pkgdesc='Lists used and unused keys in your i3wm or Sway config'
arch=('x86_64')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
options=(!lto)
depends=('libx11')
makedepends=('go' 'libxtst')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2cd4a71c3afac9909596d0872fddfab0cdb145e1bcd83f8cf716715252536b0b')

build() {
    cd $pkgname-$pkgver
    go build -trimpath -ldflags "-s -w" -o i3keys ./cmd/i3keys
}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
