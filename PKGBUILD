# Maintainer:   Simon Legner <Simon.Legner@gmail.com>
# Maintainer:   Caleb Maclennan <caleb@alerque.com>
# Contributor:  Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=lab
pkgver=0.17.0
pkgrel=2
pkgdesc="A hub-like tool for GitLab (tagged release)"
arch=('x86_64')
url="https://zaquestion.github.io/lab/"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
makedepends=('go')
conflicts=("$pkgname-git" "$pkgname-bin")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zaquestion/lab/archive/v$pkgver.tar.gz")
sha512sums=('64e21fd2b9f42d06d127ebc46f2579b687e175332fbdfb7f9f60fdda71114a411a5d4009817c5d82690fec8039bec4f80027c9c71e7f4aa4bac201deb8925c8a')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    go mod download
}

build () {
    cd "$srcdir/$pkgname-$pkgver"
    go build \
        -gcflags "all=-trimpath=$PWD" \
        -asmflags "all=-trimpath=$PWD" \
        -ldflags "-extldflags $LDFLAGS -X main.version=$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"/LICENSE
    install -Dm755 lab "$pkgdir"/usr/bin/lab
}
