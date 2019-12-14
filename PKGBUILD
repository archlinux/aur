# Maintainer:   Simon Legner <Simon.Legner@gmail.com>
# Maintainer:   Caleb Maclennan <caleb@alerque.com>
# Contributor:  Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=lab
pkgver=0.17.1
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
sha512sums=('2ffbc59e7a51616d852216ef601a5cd7f2e4d753e85cee1436bdd89e3eac02a9fb2065aa77aa1309fe7561f65e056ba36c18a7cbcbe26b2a1dcdc850cad43a81')

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
