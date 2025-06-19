# Maintainer: n00bady <kaz00@vivaldi.net>

pkgname=ttvchecker
pkgver=0.3.6
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
sha512sums=('b13dbe10cd100229b5e8157a347bfbdc8c2d575f5d960eeec59f66338e6a71d0d6d50f07725c80d41324e3ba9de1a0d8e9a5b88dd07cfc208487e697d9e2e1c2')

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

