# Maintainer: ghesy <ehsan at disroot dot org>

pkgname='git-workspace'
pkgver=1.2.0
pkgrel=1
pkgdesc='Sync personal and work git repositories from multiple providers'
url='https://github.com/orf/git-workspace'
arch=('x86_64')
license=('custom:none')
depends=('git')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b9dcc7ad2c88f63a12af4caafee05b433391a6607252330335d37676686b24f3')
options=('!lto')

_target_dir='target'

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release --locked --target-dir "$_target_dir"
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${_target_dir}/release/${pkgname}" -t "${pkgdir}/usr/bin/"
	install -dm755 "${pkgdir}/usr/lib/git-core/"
	ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/lib/git-core/"
}
