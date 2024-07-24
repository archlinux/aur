# Maintainer: n00bady <kaz00@vivaldi.net>

pkgname=ttvchecker
pkgver=0.3.5
pkgrel=1
pkgdesc="A cli tool to check if your favorite twitch streamers are online written in GO."
arch=('x86_64')
url="https://gitlab.com/n00bady/ttvchecker"
license=('GPL-3.0-only')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=('go')
depends=('glibc' 'xdg-utils')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('6c0cca11f2298d784b8f7b9d00c0548faeea559f56d4f855283712a58d1203b0dd678617e90f77f06c4dde72a49166500ef0aacda0b22c4ac713b4a25fe86d29')

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

