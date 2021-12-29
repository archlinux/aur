# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=libliftoff
pkgver=0.1.0
pkgrel=2
pkgdesc="Lightweight KMS plane library"
arch=(x86_64)
url="https://gitlab.freedesktop.org/emersion/libliftoff"
license=("custom:MIT")
depends=("libdrm")
makedepends=("git" "meson" "ninja")
source=("$pkgname::git+https://gitlab.freedesktop.org/emersion/libliftoff.git#tag=v${pkgver}")
sha512sums=('SKIP')


build() {

    meson --prefix /usr --buildtype=release "$pkgname" build
    ninja -C build
}

check() {

    ninja -C build test
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    
    cd "$pkgname"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
