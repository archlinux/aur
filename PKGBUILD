# Maintainer: n00bady <kaz00@vivaldi.net>

pkgname=ttvchecker
pkgver=0.3.7
pkgrel=1
pkgdesc="A cli tool to check if your favorite twitch streamers are online written in GO."
arch=('x86_64')
url="https://github.com/n00bady/ttvchecker"
license=('GPL-3.0-only')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=('go')
depends=('glibc' 'xdg-utils')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('eb3224ea520cbd11576c3723297a7437a4dcf2ec4e88e993893a308383bafc40c10e343e719d51624e822f4b57af0af2a011d1fb8a55c1852d5a6643f40b1e25')

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

