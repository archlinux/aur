# Maintainer: Mekyt <hello at mek dot yt>

pkgname='ory-cli'
pkgver=0.3.4
pkgrel=1
pkgdesc='Ory command line interface'
arch=('x86_64')
url='https://github.com/ory/cli'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("cli-${pkgver}.tar.gz::https://github.com/ory/cli/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('fb7ab0ce3f27c4681f16a386cc4150cf5e6ba3dd7d816faefb5054bcf41d8bb12d93c6d04d5246d71cb0aa12627d07b2de4c440bd68682768048f2cf10e62684')

build() {
    cd "cli-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

    go build -o ${pkgname} .
}

package() {
    cd "cli-${pkgver}"

    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
