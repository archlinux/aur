# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=quadlet-git
pkgver=0.2.0.r1.g28aaf07
pkgrel=1
pkgdesc="An opinionated tool for easily running podman system containers under systemd"
arch=(x86_64)
url="https://github.com/containers/quadlet"
license=("GPL2")
depends=("systemd" "podman")
makedepends=("meson" "git")
provides=("quadlet")
conflicts=("quadlet")
source=("quadlet::git+https://github.com/containers/quadlet.git")
sha512sums=('SKIP')


pkgver() {
        cd "$srcdir/quadlet"

        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

        arch-meson "$srcdir/quadlet" "$srcdir/build"
        meson compile -C build
}

check() {

        meson test -C build
}

package() {

        meson install -C build --destdir "$pkgdir"

        cd "$srcdir/quadlet"
        install -vDm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
        cp -vr "docs" "examples" "$pkgdir/usr/share/doc/$pkgname"
}
