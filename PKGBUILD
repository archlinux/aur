# Maintainer: n00bady <kaz00@vivaldi.net>

pkgname=ttvchecker
pkgver=0.3.1
pkgrel=1
pkgdesc="A cli tool to check if your favorite twitch streamers are online written in GO."
arch=('x86_64')
url="https://gitlab.com/n00bady/ttvchecker"
license=('GPL-3.0-only')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=('go')
depends=('glibc')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a2ad2afe7cf1ddb93cefc9b1a66d53f5d1cd07ce51658079b447713f77b73af0ff9bc23db688b26e56703358481711dba9249c48bfa8ba963446cdbc6bc3b4df')

build() {
    cd "$pkgname-$pkgver"
    CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}" \
    go build -buildmode=pie -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}

