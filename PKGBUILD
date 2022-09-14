# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
pkgname=cargo-sync-rdme
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="Cargo subcommand to synchronize README with crate documentation"
arch=('x86_64' 'aarch64')
url="https://github.com/gifnksm/cargo-sync-rdme"
license=('MIT' 'Apache')
depends=('libgit2' 'cargo')
conflicts=('cargo-sync-rdme-bin')
provides=('cargo-sync-rdme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gifnksm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b1a623f273be918b2c4dcf6fa925e127fbb9797ffba744142d8e262e7f9f3635')

build() {
	cd "${pkgname}-${pkgver}"
	cargo xtask dist
}

test() {
	cd "${pkgname}-${pkgver}"
	cargo xtask test
}

package() {
	cd "${pkgname}-${pkgver}/target/xtask/dist/${pkgname}-v${pkgver}/"

	install -Dm 755 "$(uname -m)-unknown-linux-gnu/cargo-sync-rdme" -t "${pkgdir}/usr/bin/"

	install -Dm 644 noarch/man/cargo-sync-rdme.1 -t "${pkgdir}/usr/share/man/man1/"

	install -Dm 644 noarch/completion/_cargo-sync-rdme -t "${pkgdir}/usr/share/zsh/site-functions/"
	install -Dm 644 noarch/completion/cargo-sync-rdme.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm 644 noarch/completion/cargo-sync-rdme.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

	install -Dm 644 noarch/LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm 644 noarch/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
