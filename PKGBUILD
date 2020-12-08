# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname="wkhtmltopdf-server"
pkgver=1.0.0
pkgrel=1
pkgdesc="Run Wkhtmltopdf as a Service"
url="https://github.com/djmattyg007/wkhtmltopdf-server"
license=("Unlicense")
arch=("x86_64")
depends=("glibc")
makedepends=("go")
source=("https://github.com/djmattyg007/wkhtmltopdf-server/archive/1.0.0.tar.gz")
sha512sums=("72d6f0ab20cff5cd89bbf0629e726d6f550e916b4501c62eea8f240c9e8c18e64694bbc3da9c6ae751a2a607054fcf569cf23ac8f436b2cfbc73e4766cab8261")

build() {
    cd "wkhtmltopdf-server-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o wkhtmltox-server wkhtmltox-server.go
}

package() {
    depends+=("wkhtmltopdf")

    cd "wkhtmltopdf-server-${pkgver}"

    install -Dm755 wkhtmltox-server "${pkgdir}/usr/bin/wkhtmltox-server"

    install -Dm644 README.txt "${pkgdir}/usr/share/doc/wkhtmltopdf-server/README.txt"
}
