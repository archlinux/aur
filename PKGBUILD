# Maintainer: Ragnar Groot Koerkamp <ragnar.grootkoerkamp at gmail dot com>
pkgname=i3-focus-last-git
_pkgname=i3-focus-last
pkgver=r43.15adab0
pkgrel=1
pkgdesc="Focus last window on i3"
arch=('any')
url="https://github.com/lbonn/i3-focus-last"
license=('MIT')
makedepends=('git' 'rust' 'cargo')
source=("${_pkgname}::git+https://github.com/lbonn/i3-focus-last")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "${_pkgname}"
	RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
	cd "${_pkgname}"
	install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
}
