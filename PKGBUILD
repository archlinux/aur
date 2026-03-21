# GSET AUR Package
# Upload this to AUR: https://aur.archlinux.org/packages/gset/

pkgname=gset-git
pkgver=2.0.2
pkgrel=1
pkgdesc="GSET - Generic Syntax Extension Tool. Write in any language syntax, compile to any language."
arch=(x86_64 aarch64)
url="https://github.com/Crazygiscool/GSETLang"
license=(CC-BY-NC-4.0)
depends=(go)
makedepends=(git)
provides=(${pkgname})
conflicts=(${pkgname})
source=("git+https://github.com/Crazygiscool/GSETLang.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/gset"
    git describe --tags --abbrev=0 2>/dev/null || echo "2.0.2"
}

build() {
    cd "$srcdir/gset"
    CGO_ENABLED=0 go build -ldflags="-s -w -X main.Version=$pkgver" -o gset .
}

package() {
    install -Dm755 "${srcdir}/gset/gset" "${pkgdir}/usr/bin/gset"
    install -Dm644 "${srcdir}/gset/gset.conf" "${pkgdir}/etc/gset.conf"
    install -Dm644 "${srcdir}/gset/LICENSE" "${pkgdir}/usr/share/licenses/gset/LICENSE"
}