# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
pkgname=souko
pkgver=0.1.0
pkgrel=2
epoch=
pkgdesc="Provides an easy way to organize clones of remote git repositories"
arch=('x86_64' 'aarch64')
url="https://github.com/gifnksm/souko"
license=('MIT' 'Apache')
depends=('libgit2')
conflicts=('souko-bin')
provides=('souko')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gifnksm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('36e84320fa7d95b9c3095e6dbbd9a22ccc3d6577ae2f9a20a906e167f272d272')

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
