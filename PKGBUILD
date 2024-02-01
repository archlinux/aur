
# Maintainer: Bagić Jure <bjure@proton.me>
pkgname='purge'
pkgver=r7.6955a80
pkgrel=1
pkgdesc="CLI tool for removing nested files"
arch=("x86_64")
url="https://github.com/b-jure/purge"
license=("GPL3")
depends=("glibc")
makedepends=("git")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    export LDFLAGS="-Wl,-z,relro,-z,now"
    cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    make
}

package() {
	cd "${pkgname}"
    install -Dm755 build/purge "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
