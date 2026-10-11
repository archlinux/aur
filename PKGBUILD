# Maintainer: Celeste <celdaemon at voidgroup dot net>
pkgname=fabricmc-cli-git
pkgver=r229.95265679
pkgrel=1
pkgdesc="Fabric modding CLI utility"
arch=('any')
url="https://github.com/FabricMC/fabricmc.net/tree/main/cli"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=("fabricmc-cli=$pkgver")
conflicts=('fabricmc-cli')
source=(
    'fabricmc::git+https://github.com/FabricMC/fabricmc.net.git'
)
sha256sums=(
    'SKIP'
)

pkgver() {
	cd "$srcdir/fabricmc"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/fabricmc"
    npm i -w scripts -w cli
}

build() {
    cd "$srcdir/fabricmc"
    npm run -w cli build
}

package() {
    cd "$srcdir/fabricmc/cli"
    install -Dm755 bundled.mjs "$pkgdir/usr/bin/fabric"
    cd "$srcdir/fabricmc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
