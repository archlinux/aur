# Maintainer:   Simon Legner <Simon.Legner@gmail.com>
# Maintainer:   Caleb Maclennan <caleb@alerque.com>
# Contributor:  Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=lab
pkgver=0.15.0
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
sha512sums=('b1b404a7ea500839b540bd191e806fb24cb8687a353113cb3e4a9e56eada111f83c574b999036820f031c9230396fb213dfdaec59b431b05e9ca4caa0da45d96')

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
