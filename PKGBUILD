# Maintainer: n00bady <kaz00@vivaldi.net>

pkgname=ttvchecker
pkgver=0.3.8
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
sha512sums=('36e8826fb7dd40d3719e20e5e1fa52c51e49fade4a9bc73545e470d2915965c44930f46bde14bf2701c0d046f548bea23a284c5eeac9fc4b272509f8466c3c72')

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

