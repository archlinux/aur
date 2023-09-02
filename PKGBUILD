# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
pkgname=souko
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Provides an easy way to organize clones of remote git repositories"
arch=('x86_64' 'aarch64')
url="https://github.com/gifnksm/souko"
license=('MIT' 'Apache')
depends=('libgit2')
conflicts=('souko-bin')
provides=('souko')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gifnksm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('653ee1e0fc0a7e91e1acb43dc6bada38db4c01624ca35e99f43b43ad8ad9e9cf')

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

	install -Dm 755 "$(uname -m)-unknown-linux-gnu/souko" -t "${pkgdir}/usr/bin/"

	install -Dm 644 noarch/man/*.1 -t "${pkgdir}/usr/share/man/man1/"

	install -Dm 644 noarch/completion/_souko -t "${pkgdir}/usr/share/zsh/site-functions/"
	install -Dm 644 noarch/completion/souko.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm 644 noarch/completion/souko.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

	install -Dm 644 noarch/LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm 644 noarch/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
