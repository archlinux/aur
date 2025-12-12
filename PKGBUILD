# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=zmx-git
pkgver=r159.651dd7c
pkgrel=1
pkgdesc="Session persistence for terminal processes"
arch=(x86_64 aarch64 i686)
url="https://zmx.sh/"
license=(MIT)
makedepends=(zig)
source=("${pkgname}::git+https://github.com/neurosnap/zmx/")
md5sums=(SKIP)

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    DESTDIR=build zig build \
        --prefix "/usr" \
        -Doptimize=ReleaseSafe
}

package() {
    cd "${srcdir}/${pkgname}"
    cp -a build/* "$pkgdir/"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
