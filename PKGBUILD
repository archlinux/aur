# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=quadlet
pkgver=0.2.2
pkgrel=1
pkgdesc="An opinionated tool for easily running podman system containers under systemd"
arch=(x86_64)
url="https://github.com/containers/quadlet"
license=("GPL2")
depends=("systemd" "podman")
makedepends=("meson" "git")
source=("quadlet::git+https://github.com/containers/quadlet.git#tag=${pkgver}")
sha512sums=('SKIP')


build() {

        arch-meson "$srcdir/quadlet" "build"
        meson compile -C "build"
}

check() {

        meson test -C "build"
}

package() {

        meson install -C "build" --destdir "$pkgdir"

        cd "$srcdir/quadlet"
        install -vDm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
        cp -vr "docs" "examples" "$pkgdir/usr/share/doc/$pkgname"
}
