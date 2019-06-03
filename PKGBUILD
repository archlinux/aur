# Maintainer:   Simon Legner <Simon.Legner@gmail.com>
# Maintainer:   Caleb Maclennan <caleb@alerque.com>
# Contributor:  Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=lab
pkgver=0.16.0
pkgrel=1
pkgdesc="A hub-like tool for GitLab (tagged release)"
arch=('x86_64')
url="https://zaquestion.github.io/lab/"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
makedepends=('go')
conflicts=("$pkgname-git" "$pkgname-bin")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zaquestion/lab/archive/v$pkgver.tar.gz")
sha512sums=('8036dd3921f2e02433274a4e3dc215e8afc604c385753105c8640f2795f4566641a30a27ce8ddb99496bab5101e573a7607ca3990c4e6587834a6ecf061e92f2')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    go mod download
}

build () {
    cd "$srcdir/$pkgname-$pkgver"
    go build \
        -gcflags "all=-trimpath=$PWD" \
        -asmflags "all=-trimpath=$PWD" \
        -ldflags "-extldflags $LDFLAGS"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"/LICENSE
    install -Dm755 lab "$pkgdir"/usr/bin/lab
}
