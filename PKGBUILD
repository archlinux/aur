# Maintainer: LucasionGS <https://github.com/LucasionGS>
pkgname=hue-cli-git
pkgver=r8.b6a2eb4
pkgrel=1
pkgdesc="A CLI tool for controlling Philips Hue lights from the terminal"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/LucasionGS/hue-cli"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=('hue-cli')
conflicts=('hue-cli')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    export GOPATH="${srcdir}/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build -trimpath -mod=readonly -o bin/hue .
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 bin/hue "${pkgdir}/usr/bin/hue"
}
