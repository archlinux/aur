_pkgname=renderide
pkgname=$_pkgname-git
pkgver=r1203.b924d8c
pkgrel=1
epoch=0
pkgdesc="A modern Rust + wgpu renderer for Resonite"
arch=('x86_64')
url="https://github.com/DoubleStyx/Renderide"
license=('MIT')
makedepends=('git' 'cargo')
options=(!lto)
install="renderide.install"
source=("$pkgname::git+https://github.com/DoubleStyx/Renderide")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "${pkgdir}/opt/${_pkgname}" "target/release/bootstrapper"
	install -Dm0755 -t "${pkgdir}/opt/${_pkgname}" "target/release/${_pkgname}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
