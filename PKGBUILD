# Maintainer: Filip Borkiewicz <boreq 0x46 net>

pkgname=htmlq-git
pkgver=r17.0cb3b72
pkgrel=1
pkgdesc='Like jq, but for HTML'
arch=('x86_64')
url='https://github.com/mgdm/htmlq'
license=('MIT')
makedepends=(
    'git'
    'rust'
)
source=("htmlq-git::git+https://github.com/mgdm/htmlq.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
	cargo build --release
}

package() {
	cd "${pkgname}/target/release"
	install -Dm755 htmlq "${pkgdir}"/usr/bin/htmlq
}
