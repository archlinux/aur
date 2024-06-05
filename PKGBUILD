# Maintainer: Mattias Cockburn <mattias.cockburn@iits-consulting.de>
pkgname=stackit-cli
_pkgver=0.8.0
pkgver=$(tr -d '-' <<<${_pkgver})
pkgrel=1
epoch=
pkgdesc="a command-line interface for the STACKIT services"
arch=(x86_64 arm64)
url="https://github.com/stackitcloud/stackit-cli"
license=('Apache2')
groups=()
depends=()
makedepends=(go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/stackitcloud/${pkgname}/archive/refs/tags/v${_pkgver}.tar.gz")
noextract=()
validpgpkeys=()

build() {
	cd "$pkgname-$_pkgver"
  go build -v -o stackit .
}

package() {
	cd "$pkgname-$_pkgver"
	install -d -m 0755 "${pkgdir}/usr/bin"
  install -m 0755 stackit "${pkgdir}/usr/bin/"
  ./stackit completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/stackit"
  ./stackit completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_stackit"
  ./stackit completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/stackit.fish"
}

sha256sums=('365c7ce1b27d31a4347ff1c27b394e29dd0e946f07c18d30cd9a1ab4771c6f96')
