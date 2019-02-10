# Maintainer:   Simon Legner <Simon.Legner@gmail.com>
# Maintainer:   Caleb Maclennan <caleb@alerque.com>
# Contributor:  Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=lab
pkgver=0.15.1
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
sha512sums=('2df5f6a4c2fd9bc4334c4d8a94286d92f6d3dae4dead04da5a3ffc1f8b662fb386a22a886d292360f4648fee3648563d0e1396330ce357dbd8f105049b5adf8f')

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
