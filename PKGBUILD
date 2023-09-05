# Maintainer: Alexander Huck <aur@alxndr13.xyz>
# Contributor: Flávio Tapajós <flavio.pereira@usp.br>
# Contributor: Hendrik 'T4cC0re' Meyer <code@t4cc0.re>
pkgname=gitlab-cli
pkgver=1.32.0
pkgrel=1
pkgdesc="Perform GitLab actions on the CLI"
arch=('x86_64')
url="https://gitlab.com/gitlab-org/cli/"
license=('MIT')
source=("https://gitlab.com/gitlab-org/cli/-/releases/v${pkgver}/downloads/glab_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=(cc7bad1c496f59bff3507e52c501847a6414c1862adb5fa1745cc6d7e8049286a55cec3ca0057ef24a9ac9b13fc5501c7bd46edfb0ca92e9bcccb2bf765717b7)

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
