# Maintainer:  jon4hz me@jon4hz.io

pkgname=aaregurucli-git
pkgver=0.4.3.r12.g2e5e424
pkgrel=1
pkgdesc="aare.guru CLI "
arch=(x86_64)
url="https://github.com/gexclaude/aaregurucli"
license=('GPL3')
depends=(glibc)
makedepends=(go git)
provides=(aaregurucli)
conflicts=(aaregurucli)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd aaregurucli
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd aaregurucli
    go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
	cd aaregurucli
	install -Dm755 aaregurucli "${pkgdir}"/usr/bin/aaregurucli
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/{pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/{pkgname}/README.md"
}
