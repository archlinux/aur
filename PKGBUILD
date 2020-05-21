# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=libliftoff
pkgname=${_pkgname}-git
pkgver=r126.2b02f50
pkgrel=1
pkgdesc="Lightweight KMS plane library"
arch=(x86_64)
url="https://github.com/emersion/libliftoff"
license=("custom:MIT")
depends=("libdrm")
makedepends=("git" "meson" "ninja")
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/emersion/libliftoff.git")
sha512sums=('SKIP')


pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

    meson --prefix /usr --buildtype=release "$srcdir/$_pkgname" build
    ninja -C build
}

check() {

    ninja -C build test
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    
    cd "$srcdir/$_pkgname"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
