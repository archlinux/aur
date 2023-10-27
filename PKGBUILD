# Maintainer: Alexander Huck <aur@alxndr13.xyz>
# Contributor: Flávio Tapajós <flavio.pereira@usp.br>
# Contributor: Hendrik 'T4cC0re' Meyer <code@t4cc0.re>
pkgname=gitlab-cli
pkgver=1.34.0
pkgrel=1
pkgdesc="Perform GitLab actions on the CLI"
arch=('x86_64')
url="https://gitlab.com/gitlab-org/cli/"
license=('MIT')
source=("https://gitlab.com/gitlab-org/cli/-/releases/v${pkgver}/downloads/glab_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=(2c4731724df518a1886577ed93e09e60476f29029d6a588ab6acd572e1eff5d639ac820fe727b1bab1807a4c2bba2a28002a27f2d9d17c1506eaba676db1f47b)

build() {
	# create completion scripts
	mkdir -p "${srcdir}/fish/vendor_completions.d/"
	"${srcdir}/bin/glab" completion -s fish > "${srcdir}/fish/vendor_completions.d/glab.fish"

	mkdir -p "${srcdir}/bash-completion/completions/"
	"${srcdir}/bin/glab" completion -s bash > "${srcdir}/bash-completion/completions/glab"

	mkdir -p "${srcdir}/zsh/site-functions/"
	"${srcdir}/bin/glab" completion -s zsh > "${srcdir}/zsh/site-functions/_glab"
}

package() {
	install -m644 -D "${srcdir}/fish/vendor_completions.d/glab.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/glab.fish"
	install -m644 -D "${srcdir}/bash-completion/completions/glab" "${pkgdir}/usr/share/bash-completion/completions/glab"
	install -m644 -D "${srcdir}/zsh/site-functions/_glab" "${pkgdir}/usr/share/zsh/site-functions/_glab"

	install -m755 -D "${srcdir}/bin/glab" "${pkgdir}/usr/bin/glab"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
