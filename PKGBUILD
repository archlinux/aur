# Maintainer: Luís Ferreira <net dot lsferreira at contact, backwards>

pkgname=railwayapp-cli
pkgver=2.1.0
pkgrel=1
pkgdesc="Command Line Interface for Railway.app"
arch=("x86_64")
url="https://railway.app/"
license=("MIT")
depends=('glibc')
makedepends=("go" "git")
source=("git+https://github.com/railwayapp/cli.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/cli"
    export CGO_LDFLAGS="$LDFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    make build
}

package(){
    cd "${srcdir}/cli"
    install -Dm755 bin/railway -t "$pkgdir/usr/bin"
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
