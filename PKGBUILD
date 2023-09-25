# Maintainer: Alexander Huck <aur@alxndr13.xyz>
# Contributor: Flávio Tapajós <flavio.pereira@usp.br>
# Contributor: Hendrik 'T4cC0re' Meyer <code@t4cc0.re>
pkgname=gitlab-cli
pkgver=1.33.0
pkgrel=1
pkgdesc="Perform GitLab actions on the CLI"
arch=('x86_64')
url="https://gitlab.com/gitlab-org/cli/"
license=('MIT')
source=("https://gitlab.com/gitlab-org/cli/-/releases/v${pkgver}/downloads/glab_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=(a1d76af8833bb2d2b0b9ea078455774bd301bb1cbf722918c1b43f03a258658b775305e8b15a72f5fa67d4af6fa2c7d1a04e0c837a9b8c0db03ca8247654dd8c)

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
